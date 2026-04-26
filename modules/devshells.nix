{
  perSystem =
    { pkgs, ... }:
    let
      dotnetSdk = pkgs.dotnetCorePackages.sdk_10_0 or pkgs.dotnetCorePackages.sdk_9_0;
      jdk = pkgs.jdk25 or pkgs.jdk;
    in
    {
      devShells = {
        dotnet = pkgs.mkShell {
          packages = [ dotnetSdk ];
        };

        nodejs = pkgs.mkShell {
          packages = with pkgs; [
            nodejs_22
            corepack
            pnpm
            yarn
          ];
        };

        python = pkgs.mkShell {
          packages = with pkgs; [
            python3
            python3Packages.pip
            python3Packages.virtualenv
          ];
        };

        java = pkgs.mkShell {
          packages = [ jdk ];
        };
      };
    };
}
