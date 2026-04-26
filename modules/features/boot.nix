{
  flake.modules.nixos.boot = {
    boot.loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
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

    zramSwap.enable = true;
  };
}
