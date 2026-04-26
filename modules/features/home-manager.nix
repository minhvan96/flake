{ config, inputs, ... }:

{
  flake.modules.nixos.home-manager = {
    imports = [
      inputs.home-manager.nixosModules.home-manager
    ];

    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      backupFileExtension = "hm-backup";

      users.${config.username} =
        { pkgs, ... }:
        {
          imports = [
            config.flake.modules.homeManager.shell
            config.flake.modules.homeManager.git
            config.flake.modules.homeManager.apps
          ];

          home.username = config.username;
          home.homeDirectory = "/home/${config.username}";
          home.stateVersion = config.stateVersion;

          programs.home-manager.enable = true;

          home.packages = with pkgs; [
            oh-my-zsh
          ];
        };
    };
  };
}
