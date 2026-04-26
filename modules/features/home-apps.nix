{
  flake.modules.homeManager.apps = {
    xdg.enable = true;

    programs.vscode = {
      enable = true;
      profiles.default.userSettings = {
        "editor.formatOnSave" = true;
        "files.eol" = "\n";
        "terminal.integrated.defaultProfile.linux" = "zsh";
      };
    };
  };
}
