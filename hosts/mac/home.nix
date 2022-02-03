{ pkgs, ... }:
{
  imports = [
    ../../modules/neuron.nix
  ];

  home = {
    username = "williambadart";
    homeDirectory = "/Users/williambadart";
    sessionPath = [
      "/Users/williambadart/Library/Python/3.9/bin"
      "/Users/williambadart/.emacs.d/bin"
    ];
    sessionVariables = {
      DOOMDIR = "/Users/williambadart/Documents/dotfiles/modules/doom";
    };
    packages = with pkgs; [
      agda
      agda-pkg
      curlie
      emacs-nox
      (ghc.withPackages (p: [p.lens p.relude]))
      python39Packages.pipx
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
}
