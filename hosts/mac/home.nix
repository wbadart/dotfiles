{ pkgs, ... }:
{
  home = {
    username = "williambadart";
    homeDirectory = "/Users/williambadart";
    sessionPath = [
      "/Applications/Racket v7.8/bin"
    ];
    packages = with pkgs; [
      agda
      agda-pkg
      emacs
      emacs.pkgs.agda2-mode
      emacs.pkgs.doom
    ];
  };

  programs.git.userEmail = "Badart_William@bah.com";
  programs.zsh = {
    enable = true;
    initExtra = ''
      if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then
        . $HOME/.nix-profile/etc/profile.d/nix.sh;
      fi
      exec fish --login --interactive
    '';
  };
}
