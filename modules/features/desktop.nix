{
  flake.modules.nixos.desktop =
    { lib, pkgs, ... }:
    let
      optionalKde = name: lib.optional (builtins.hasAttr name pkgs.kdePackages) pkgs.kdePackages.${name};
    in
    {
      services.xserver.enable = true;

      services.displayManager.sddm = {
        enable = true;
        wayland.enable = true;
      };
      services.displayManager.defaultSession = "plasma";
      services.desktopManager.plasma6.enable = true;

      environment.sessionVariables = {
        NIXOS_OZONE_WL = "1";
        QT_QPA_PLATFORM = "wayland;xcb";
        GDK_BACKEND = "wayland,x11,*";
      };

      services.xserver.videoDrivers = [ "nvidia" ];
      hardware.graphics = {
        enable = true;
        enable32Bit = true;
        extraPackages = with pkgs; [
          vaapiVdpau
          libvdpau-va-gl
        ];
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

      services.ratbagd.enable = true;

      fonts.packages = with pkgs; [
        noto-fonts
        noto-fonts-cjk-sans
        liberation_ttf
        jetbrains-mono
      ];

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
        kdePackages.kio-extras
        libsForQt5.qt5ct
        wl-clipboard
        xclip

        piper
        thunderbird
        vlc
      ]
      ++ optionalKde "kcolorchooser"
      ++ optionalKde "partitionmanager"
      ++ optionalKde "kwalletmanager"
      ++ optionalKde "kio-admin"
      ++ optionalKde "plasma-systemmonitor"
      ++ optionalKde "plasma-browser-integration"
      ++ optionalKde "print-manager";
    };
}
