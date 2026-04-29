{ lib, ... }:
{
  programs.git = {
    enable = true;
    lfs.enable = true;
    settings = {
      user.name = lib.mkDefault "Will Badart";
      user.email = lib.mkDefault "will@willbadart.com";
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
      alias = {
        lo = "log --decorate --graph --oneline";
        lol = "log --all --decorate --graph --oneline";
      };
    };
  };

  home.shellAliases = {
    g = "git";
    ga = "git add";
    gb = "git branch";
    gc = "git commit -v";
    gca = "git commit -av";
    gcb = "git checkout -b";
    gcl = "git clone --recursive";
    gco = "git checkout";
    gd = "git diff";
    gdc = "git diff --cached";
    gdm = "git diff --merge-base";
    gf = "git fetch --all --prune";
    gl = "git pull";
    gp = "git push";
    gr = "git rebase";
    grm = "git remote";
    gs = "git stash";
    gst = "git status";
  };

  programs.delta = {
    enable = true;
    enableGitIntegration = true;
  };

  programs.jujutsu = {
    enable = true;
    settings = {
      user.name = "Will Badart";
      user.email = "will@willbadart.com";
    };
  };
  programs.jjui.enable = true;
}
