{
  imports = [
    ../home.nix
  ];

  home.username = "will";
  home.homeDirectory = "/home/will";
  dotfiles.hostAttr = "mba";
  dotfiles.location = "$HOME/Documents/dotfiles";
  dotfiles.neovim.enable = true;

  services.tailscale-systray.enable = true;
}
