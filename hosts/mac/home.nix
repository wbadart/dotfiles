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
    ];
    packages = with pkgs; [
      agda
      agda-pkg
      curlie
      emacs
      emacs.pkgs.agda2-mode
      emacs.pkgs.doom
      (ghc.withPackages (p: [p.lens p.relude]))
      python39Packages.pipx
      # racket-minimal
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
  programs.fish.shellAliases.c = "curlie";
}
