{ pkgs, ... }:
{
  home = {
    username = "williambadart";
    homeDirectory = "/Users/williambadart";
    sessionPath = [
      "/Applications/Racket v7.8/bin"
    ];
    sessionVariables = {
      LEDGER_FILE = "$HOME/Documents/ledger/JAN2021.journal";
    };
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
