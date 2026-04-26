{
  flake.modules.nixos.development =
    { pkgs, ... }:
    let
      dotnetSdk = pkgs.dotnetCorePackages.sdk_10_0 or pkgs.dotnetCorePackages.sdk_9_0;
      jdk = pkgs.jdk25 or pkgs.jdk;
    in
    {
      programs.git.enable = true;
      programs.adb.enable = true;

      environment.systemPackages = with pkgs; [
        dotnetSdk
        nodejs_22
        corepack
        pnpm
        yarn
        jdk

        gcc
        gnumake
        cmake
        pkg-config
        openssl
        openssl.dev
        bison
        flex
        patch
        rpm

        git-lfs
        gh
        jq
        yq-go
        curl
        wget
        tree
        tmux
        less
        unzip
        zip
        p7zip
        rsync
        lsof
        tcpdump
        mtr
        traceroute
        bind
        fastfetch
        file
        ripgrep
        fd
        bat
        eza
        fzf
        direnv
        nil
        nixfmt-rfc-style

        python3
        python3Packages.pip
        python3Packages.virtualenv

        vscode
        jetbrains.rider
        jetbrains.webstorm
      ];
    };
}
