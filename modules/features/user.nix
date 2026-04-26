{ config, ... }:

{
  flake.modules.nixos.user =
    { pkgs, ... }:
    {
      programs.zsh.enable = true;

      users.users.${config.username} = {
        isNormalUser = true;
        description = config.username;
        shell = pkgs.zsh;
        extraGroups = [
          "wheel"
          "networkmanager"
          "disk"
          "libvirtd"
          "podman"
          "video"
          "audio"
          "input"
        ];
      };

      security.sudo.wheelNeedsPassword = true;
    };
}
