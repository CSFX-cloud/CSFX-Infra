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
    import time

    HEALTH = "curl -sk -o /dev/null -w '%{http_code}' https://localhost:8000/api/public-key"
    SENTINEL_FILE = "/var/lib/csfx-data/csfx/upgrade-sentinel"


    def wait_healthy():
        machine.wait_for_unit("multi-user.target")
        machine.wait_until_succeeds(f"{HEALTH} | grep -E '^(200|401)$'", timeout=900)


    def assert_stable():
        state = machine.succeed("systemctl is-system-running --wait || true").strip()
        assert state != "degraded", f"system is {state}"
        failed = machine.succeed("systemctl --failed --no-legend").strip()
        assert failed == "", f"failed units:\n{failed}"
        restarts = machine.succeed(
            "systemctl show 'csfx-*.service' -p Id,NRestarts"
        ).replace("\n\n", "\n").splitlines()
        looping = [
            restarts[index].split("=")[1]
            for index in range(0, len(restarts) - 1, 2)
            if restarts[index + 1] != "NRestarts=0"
        ]
        assert not looping, f"units restarted: {looping}"


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
    assert_stable()

    machine.succeed("nix-env -p /nix/var/nix/profiles/system --set /run/current-system/specialisation/upgraded")
    machine.succeed("/run/current-system/specialisation/upgraded/bin/switch-to-configuration switch")
    wait_healthy()

    timers = machine.succeed(
        "systemctl list-timers --all --no-legend 'csfx*' | awk '{print $NF}'"
    ).split()
    for service in timers:
        machine.succeed(f"systemctl start --no-block {service}")
    time.sleep(600)
    assert_stable()
    assert_state_intact()

    machine.succeed("/nix/var/nix/profiles/system/bin/switch-to-configuration boot")
    machine.shutdown()
    machine.start()
    wait_healthy()
    machine.succeed("readlink /run/current-system | grep -F \"$(readlink -f /nix/var/nix/profiles/system)\"")
    assert_stable()
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
