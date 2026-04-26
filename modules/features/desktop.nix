{
  flake.modules.nixos.desktop =
    { lib, pkgs, ... }:
    let
      optionalKde = name: lib.optional (builtins.hasAttr name pkgs.kdePackages) pkgs.kdePackages.${name};
    in
    {
      services.xserver.enable = true;
      services.displayManager.sddm.enable = true;
      services.desktopManager.plasma6.enable = true;

      services.xserver.videoDrivers = [ "nvidia" ];
      hardware.graphics = {
        enable = true;
        enable32Bit = true;
      };

      hardware.nvidia = {
        modesetting.enable = true;
        powerManagement.enable = true;
        open = false;
        nvidiaSettings = true;
        package = pkgs.linuxPackages.nvidiaPackages.stable;
      };

      services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        jack.enable = true;
      };

      security.rtkit.enable = true;
      hardware.bluetooth.enable = true;
      services.blueman.enable = true;

      environment.systemPackages = with pkgs; [
        kdePackages.dolphin
        kdePackages.kate
        kdePackages.kcalc
        kdePackages.kcharselect
        kdePackages.konsole
        kdePackages.okular
        kdePackages.spectacle
        kdePackages.yakuake
        kdePackages.gwenview
        kdePackages.filelight
        kdePackages.kdeconnect-kde
        kdePackages.kio-extras
        libsForQt5.qt5ct
        wl-clipboard
        xclip
      ]
      ++ optionalKde "kcolorchooser"
      ++ optionalKde "partitionmanager"
      ++ optionalKde "kwalletmanager"
      ++ optionalKde "kio-admin"
      ++ optionalKde "plasma-systemmonitor"
      ++ optionalKde "plasma-browser-integration";
    };
}
