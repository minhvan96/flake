{
  flake.modules.nixos.flatpak =
    { lib, pkgs, ... }:
    let
      optionalPkg = name: lib.optional (builtins.hasAttr name pkgs) pkgs.${name};
    in
    {
      services.flatpak.enable = true;
      xdg.portal.enable = true;
      xdg.portal.extraPortals = [ pkgs.kdePackages.xdg-desktop-portal-kde ];

      environment.systemPackages = with pkgs; [
        flatpak
        brave
        chromium
        firefox
        mpv
        vlc
        yt-dlp
        qbittorrent
        libreoffice-fresh
      ]
      ++ optionalPkg "bitwarden-desktop"
      ++ optionalPkg "telegram-desktop"
      ++ optionalPkg "pika-backup";

      systemd.services.nmv-install-flatpaks = {
        description = "Install nmv Flatpak applications";
        wantedBy = [ "multi-user.target" ];
        after = [ "network-online.target" ];
        wants = [ "network-online.target" ];
        path = [ pkgs.flatpak ];
        serviceConfig = {
          Type = "oneshot";
          RemainAfterExit = true;
        };
        script = ''
          marker=/var/lib/nmv-flatpaks-installed
          if [ -e "$marker" ]; then
            exit 0
          fi

          flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
          flatpak install -y flathub \
            app.zen_browser.zen \
            com.bitwarden.desktop \
            com.heroicgameslauncher.hgl \
            com.surfshark.Surfshark \
            com.valvesoftware.Steam \
            io.podman_desktop.PodmanDesktop \
            net.nokyan.Resources \
            org.gnome.World.PikaBackup \
            org.telegram.desktop

          touch "$marker"
        '';
      };

      programs.steam = {
        enable = true;
        remotePlay.openFirewall = true;
        dedicatedServer.openFirewall = true;
      };
    };
}
