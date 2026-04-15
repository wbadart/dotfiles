{
  programs.git = {
    enable = true;
    lfs.enable = true;
    settings = {
      user = {
        name = "Will Badart";
        email = "will@willbadart.com";
      };
      init.defaultBranch = "main";
      alias = {
        lol = "log --all --decorate --graph --oneline";
      };
    };
  };

  home.shellAliases = {
    g = "git";
    ga = "git add";
    gb = "git branch";
    gc = "git commit -v";
    gcb = "git checkout -b";
    gca = "git commit -av";
    gcl = "git clone --recursive";
    gco = "git checkout";
    gd = "git diff";
    gdc = "git diff --cached";
    gdm = "git diff --merge-base";
    gf = "git fetch";
    gl = "git pull";
    gp = "git push";
    gr = "git rebase";
    grm = "git remote";
    gst = "git status";
  };

  programs.delta = {
    enable = true;
    enableGitIntegration = true;
  };
}
