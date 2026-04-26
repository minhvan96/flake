{
  flake.modules.nixos.gaming =
    { pkgs, ... }:
    {
      programs.steam = {
        enable = true;
        remotePlay.openFirewall = true;
        dedicatedServer.openFirewall = true;
        gamescopeSession.enable = true;
        extraCompatPackages = [ pkgs.proton-ge-custom ];
      };

      programs.gamemode.enable = true;
      programs.gamescope.enable = true;
      programs.mangohud.enable = true;

      hardware.graphics.extraPackages32 = with pkgs.pkgsi686Linux; [
        vaapiVdpau
      ];
    };
}
