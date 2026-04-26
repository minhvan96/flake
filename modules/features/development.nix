{
  flake.modules.nixos.development =
    { pkgs, ... }:
    {
      programs.git.enable = true;
      programs.adb.enable = true;

      environment.systemPackages = with pkgs; [
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
        gocryptfs
        git-credential-manager

        jetbrains.rider
        jetbrains.webstorm
      ];
    };
}
