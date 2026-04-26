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

    time.timeZone = "Asia/Ho_Chi_Minh";
    system.stateVersion = config.stateVersion;
  };
}
