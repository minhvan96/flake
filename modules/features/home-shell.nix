{
  flake.modules.homeManager.shell = {
    programs.zsh = {
      enable = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      oh-my-zsh = {
        enable = true;
        theme = "robbyrussell";
        plugins = [ "git" ];
      };
      initContent = ''
        export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
      '';
    };

    home.sessionPath = [
      "$HOME/.local/bin"
      "$HOME/.dotnet/tools"
      "$HOME/.local/share/JetBrains/Toolbox/scripts"
    ];

    programs.direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };
}
