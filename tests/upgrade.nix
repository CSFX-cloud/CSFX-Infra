{ pkgs, previous, current }:

let
  modulesOf = system: system._module.args.modules;
  versionsOf = system: system._module.specialArgs.versions;

  testHost = { lib, pkgs, ... }: {
    networking.hostName = lib.mkForce "machine";
    environment.systemPackages = [ pkgs.curl pkgs.etcd pkgs.jq ];

    virtualisation = {
      memorySize = 4096;
      cores = 2;
      emptyDiskImages = [ 2048 ];
      useBootLoader = true;
      useEFIBoot = true;
    };

    boot.loader = {
      grub.enable = lib.mkForce false;
      systemd-boot.enable = lib.mkForce true;
      efi.canTouchEfiVariables = lib.mkForce true;
    };

    services = {
      csfx-setup.dataPart = lib.mkForce "/dev/vdb";
      csfx-agent = {
        enableFirecracker = lib.mkForce false;
        enableQemu = lib.mkForce false;
      };
    };
  };

  upgradeScript = ''
    import re
    import time

    HEALTH = "curl -sk -o /dev/null -w '%{http_code}' https://localhost:8000/api/public-key"
    SENTINEL_FILE = "/var/lib/csfx-data/csfx/upgrade-sentinel"
    SETTLE_SECONDS = 60


    def wait_healthy():
        machine.wait_until_succeeds(f"{HEALTH} | grep -E '^(200|401)$'", timeout=900)


    def snapshot():
        output = machine.succeed("systemctl show '*.service' -p Id,ActiveState,NRestarts")
        units = {}
        for block in output.strip().split("\n\n"):
            props = dict(line.split("=", 1) for line in block.splitlines())
            units[props["Id"]] = (props["ActiveState"], int(props["NRestarts"]))
        return units


    def timer_services():
        output = machine.succeed("systemctl list-timers --all --no-legend | awk '{print $NF}'")
        return set(output.split())


    def settled_units():
        first = snapshot()
        time.sleep(SETTLE_SECONDS)
        second = snapshot()
        skipped = timer_services()
        return {
            unit: restarts
            for unit, (state, restarts) in second.items()
            if state == "active" and first.get(unit) == (state, restarts) and unit not in skipped
        }


    def switch_to_upgraded(baseline):
        status, output = machine.execute(
            "/run/current-system/specialisation/upgraded/bin/switch-to-configuration switch 2>&1"
        )
        assert status in (0, 4), f"switch-to-configuration exited with {status}:\n{output}"
        match = re.search(r"the following units failed: (.*)", output)
        assert status == 0 or match, f"switch failed without failed units:\n{output}"
        failed = set(re.split(r"[,\s]+", match.group(1).strip())) if match else set()
        regressed = failed & set(baseline)
        assert not regressed, f"units from the baseline failed during the switch: {regressed}"


    def assert_stable(baseline):
        now = snapshot()
        broken = {
            unit: now.get(unit)
            for unit, restarts in baseline.items()
            if unit not in now or now[unit][0] != "active" or now[unit][1] > restarts
        }
        assert not broken, f"units unstable after upgrade: {broken}"


    def assert_state_intact():
        machine.succeed(f"test \"$(cat {SENTINEL_FILE})\" = sentinel")
        machine.succeed("test -f /var/lib/csfx-data/csfx/.setup-complete")
        machine.succeed("sha256sum -c /root/cp-env.sha256")
        machine.succeed("ETCDCTL_API=3 etcdctl get /csfx/test/sentinel --print-value-only | grep -x sentinel")
        machine.succeed(f"{HEALTH} | grep -E '^(200|401)$'")


    start_all()
    wait_healthy()
    machine.wait_for_file("/var/lib/csfx-data/csfx/.setup-complete")
    machine.succeed(f"echo sentinel > {SENTINEL_FILE}")
    machine.succeed("sha256sum /etc/csfx/cp.env > /root/cp-env.sha256")
    machine.wait_until_succeeds("ETCDCTL_API=3 etcdctl put /csfx/test/sentinel sentinel")
    baseline = settled_units()
    assert baseline, "no service was stable before the upgrade"

    machine.succeed("nix-env -p /nix/var/nix/profiles/system --set /run/current-system/specialisation/upgraded")
    switch_to_upgraded(baseline)
    wait_healthy()

    for service in machine.succeed(
        "systemctl list-timers --all --no-legend 'csfx*' | awk '{print $NF}'"
    ).split():
        machine.succeed(f"systemctl start --no-block {service}")
    time.sleep(600)
    assert_stable(baseline)
    assert_state_intact()

    machine.succeed("/nix/var/nix/profiles/system/bin/switch-to-configuration boot")
    machine.shutdown()
    machine.start()
    wait_healthy()
    machine.succeed("readlink /run/current-system | grep -F \"$(readlink -f /nix/var/nix/profiles/system)\"")
    time.sleep(SETTLE_SECONDS)
    assert_stable(baseline)
    assert_state_intact()
  '';
in
pkgs.testers.runNixOSTest {
  name = "csfx-upgrade-n1-to-n";

  nodes.machine = { modulesPath, ... }: {
    imports = modulesOf previous ++ [ testHost ];
    _module.args.versions = versionsOf previous;

    specialisation.upgraded = {
      inheritParentConfig = false;
      configuration = {
        imports = modulesOf current ++ [
          testHost
          "${modulesPath}/virtualisation/qemu-vm.nix"
          "${modulesPath}/testing/test-instrumentation.nix"
        ];
        nixpkgs.hostPlatform = pkgs.stdenv.hostPlatform.system;
        _module.args.versions = versionsOf current;
      };
    };
  };

  testScript = upgradeScript;
}
