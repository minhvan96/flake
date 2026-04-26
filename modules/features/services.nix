{
  flake.modules.nixos.services = {
    services.openssh = {
      enable = true;
      settings.PasswordAuthentication = false;
    };

    services.printing.enable = true;
    services.fwupd.enable = true;
    services.thermald.enable = true;
    services.upower.enable = true;
    services.udisks2.enable = true;
    services.smartd.enable = true;
    services.fstrim.enable = true;
    services.chrony.enable = true;

    programs.kdeconnect.enable = true;
    programs.dconf.enable = true;
    programs.nh.enable = true;
  };
}
