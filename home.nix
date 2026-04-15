let
  sources = import ./npins;
in
{
  imports = [
    ./modules/git.nix
    ./modules/hledger.nix
    ./modules/nix.nix
    ./modules/tmux
    ./modules/nvim
    ./modules/zsh.nix
    "${sources.agenix}/modules/age-home.nix"
  ];

  xdg.enable = true;
  home.preferXdgDirectories = true;

  home.stateVersion = "26.05";
  programs.home-manager = {
    enable = true;
    path = "${sources.home-manager}";
  };
}
