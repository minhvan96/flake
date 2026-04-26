{
  flake.modules.nixos.virtualization =
    { pkgs, ... }:
    {
      virtualisation.libvirtd = {
        enable = true;
        qemu = {
          package = pkgs.qemu_kvm;
          runAsRoot = false;
          swtpm.enable = true;
          ovmf.enable = true;
          ovmf.packages = [ pkgs.OVMFFull.fd ];
        };
      };

      programs.virt-manager.enable = true;
      services.spice-vdagentd.enable = true;

      environment.systemPackages = with pkgs; [
        virt-viewer
        virtiofsd
        swtpm
      ];
    };
}
