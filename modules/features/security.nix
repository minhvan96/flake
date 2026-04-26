{
  flake.modules.nixos.security = {
    security.polkit.enable = true;
    security.pam.services.sddm.enableKwallet = true;

    programs.gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };

    services.pcscd.enable = true;
  };
}
