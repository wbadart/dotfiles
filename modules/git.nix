{ lib, pkgs, ... }:
let
  name = lib.mkDefault "Will Badart";
  email = lib.mkDefault "will@willbadart.com";
in
{
  programs.git = {
    enable = true;
    lfs.enable = true;
    settings = {
      user.name = name;
      user.email = email;
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

    j = "jj";
    jb = "jj bookmark";
    jba = "jj bookmark advance";
    jc = "jj commit";
    jci = "jj commit --iteractive";
    je = "jj edit";
    jd = "jj diff";
    jds = "jj describe";
    jf = "jj git fetch --all-remotes";
    jg = "jj git";
    jn = "jj new";
    jp = "jj git push";
    jr = "jj rebase";
    js = "jj squash";
    jst = "jj status";
  };

  programs.delta = {
    enable = true;
    enableGitIntegration = true;
    enableJujutsuIntegration = true;
  };

  programs.jujutsu = {
    enable = true;
    settings = {
      user.name = name;
      user.email = email;
    };
  };

  programs.jjui.enable = true;

  programs.starship = {
    extraPackages = [ pkgs.jj-starship ];
    settings = {
      custom.jj = {
        when = "jj-starship detect";
        shell = ["jj-starship" "--no-git-id"];
        format = "$output ";
      };
      git_branch.disabled = true;
      git_status.disabled = true;
    };
  };
}
