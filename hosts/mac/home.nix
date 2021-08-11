{ pkgs, ... }:
{
  imports = [
    ../../modules/neuron.nix
  ];

  home = {
    username = "williambadart";
    homeDirectory = "/Users/williambadart";
    sessionPath = [
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

  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        # padding = { x = 20; y = 20; };
        decorations = "transparent";
      };
      font = {
        size = 14.0;
        normal.family = "LiterationMono Nerd Font Mono";
        offset.y = 10;
        glyph_offset.y = 5;
      };
      mouse = {
        hide_when_typing = true;
      };
      cursor = {
        style = {
          shape = "Beam";
        };
      };
    };
  };
}
