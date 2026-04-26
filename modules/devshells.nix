{
  perSystem =
    { pkgs, ... }:
    let
      dotnetSdk = pkgs.dotnetCorePackages.sdk_10_0;
    in
    {
      devShells = {
        dotnet = pkgs.mkShell {
          packages = with pkgs; [
            dotnetSdk
            nodejs_22
            corepack
            pnpm
            yarn
          ];
          env.DOTNET_ROOT = "${dotnetSdk}";
        };

        python = pkgs.mkShell {
          packages = with pkgs; [
            python3
            python3Packages.pip
            python3Packages.virtualenv
          ];
        };
      };
    };
}
