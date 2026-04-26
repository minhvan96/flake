{
  flake.modules.homeManager.git = {
    programs.git = {
      enable = true;
      userName = "nmv";
      userEmail = "minhvan.996@outlook.com";
      aliases = {
        cm = "commit -am";
      };
      extraConfig = {
        core.autocrlf = "input";
        init.defaultBranch = "main";
        credential.helper = "/run/current-system/sw/bin/git-credential-manager";
        "credential \"https://dev.azure.com\"".useHttpPath = true;
      };
    };
  };
}
