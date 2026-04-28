{
  imports = [
    ../home.nix
  ];

  home.username = "will";
  home.homeDirectory = "/home/will";
  dotfiles = {
    hostAttr = "mba";
    location = "$HOME/Documents/dotfiles";
    neovim.enable = true;
    secrets.enable = true;
  };

  services.tailscale-systray.enable = true;
  home.shellAliases = {
    ts = "tailscale";
  };
}
