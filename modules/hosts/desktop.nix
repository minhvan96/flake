{ config, ... }:

let
  inherit (config.flake.modules) nixos;
in
{
  configurations.nixos.desktop.module = {
    imports = [
      ./hardware-configuration.nix
      nixos.boot
      nixos.containers
      nixos.desktop
      nixos.development
      nixos.flatpak
      nixos.locale
      nixos.networking
      nixos.nix
      nixos.security
      nixos.services
      nixos.user
      nixos.virtualization
      nixos.home-manager
    ];

    networking.hostName = config.hostName;
    nixpkgs.hostPlatform = "x86_64-linux";
    system.stateVersion = config.stateVersion;
  };
}
