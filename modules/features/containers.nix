{
  flake.modules.nixos.containers =
    { pkgs, ... }:
    {
      virtualisation.podman = {
        enable = true;
        dockerCompat = true;
        defaultNetwork.settings.dns_enabled = true;
      };

      virtualisation.containers.enable = true;

      environment.systemPackages = with pkgs; [
        podman
        podman-compose
        podman-tui
        buildah
        skopeo
        dive
      ];
    };
}
