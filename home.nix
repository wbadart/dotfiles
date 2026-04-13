{
  imports = [
    ./modules/git.nix
    ./modules/hledger.nix
    ./modules/nvim
    ./modules/zsh.nix
  ];

  xdg.enable = true;
  home.preferXdgDirectories = true;

  home.stateVersion = "26.05";
  programs.home-manager.enable = true;
}
