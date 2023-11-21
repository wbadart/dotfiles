{ pkgs, ... }:
{
  home.packages = with pkgs; [
    emacs-nox

    # Doom requirements
    git
    ripgrep
    findutils
    fd

    # Flycheck deps
    ispell
  ];
  home.sessionPath = [
    "$HOME/.emacs.d/bin"
  ];
}
