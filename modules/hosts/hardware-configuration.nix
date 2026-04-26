# Replace this after installing NixOS:
#
#   sudo nixos-generate-config --show-hardware-config > modules/hosts/hardware-configuration.nix
#
# This placeholder is intentionally small so the flake has a stable import path.
{ modulesPath, ... }:

{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];
}
