{ inputs, ... }:

{
  flake.modules.nixos.boot =
    { lib, pkgs, ... }:
    {
      imports = [ inputs.lanzaboote.nixosModules.lanzaboote ];

      boot.loader = {
        systemd-boot.enable = lib.mkForce false;
        efi.canTouchEfiVariables = true;
      };

      boot.lanzaboote = {
        enable = true;
        pkiBundle = "/etc/secureboot";
      };

      boot.initrd.availableKernelModules = [
        "nvme"
        "xhci_pci"
        "ahci"
        "usbhid"
        "usb_storage"
        "sd_mod"
      ];

      boot.kernelModules = [
        "kvm-amd"
        "i2c-dev"
      ];

      boot.kernelParams = [
        "nvidia-drm.modeset=1"
      ];

      boot.supportedFilesystems = [ "ntfs" ];

      environment.systemPackages = [ pkgs.sbctl ];

      zramSwap.enable = true;
    };
}
