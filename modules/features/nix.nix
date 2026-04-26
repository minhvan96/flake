{ config, ... }:

{
  flake.modules.nixos.nix = {
    nix = {
      settings = {
        experimental-features = [
          "nix-command"
          "flakes"
        ];
        auto-optimise-store = true;
      };

      gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 14d";
      };
    };

    nixpkgs.config.allowUnfree = true;

    environment.variables = {
      DOTNET_ROOT = "/run/current-system/sw/share/dotnet";
    };

    time.timeZone = "Asia/Ho_Chi_Minh";
    system.stateVersion = config.stateVersion;
  };
}
