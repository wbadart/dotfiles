let neuronPkg = import (builtins.fetchGit {
  url = "https://github.com/srid/neuron.git";
  ref = "master";
  rev = "998fce27ccc91231ef9757e2bebeb39327850092";
});
in
{ pkgs, ... }:
{
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
      # racket-minimal
      neuronPkg.default
      smimesign
    ];
  };

  programs.git = {
    userEmail = "Badart_William@bah.com";
    extraConfig.gpg = {
      format = "x509";
      x509.program = "smimesign";
    };
    signing.key = "954a581cdfb686755165d80850b5e738b1952110";
  };
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
