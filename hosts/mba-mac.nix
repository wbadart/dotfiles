{ pkgs, ... }:
{
  imports = [
    "${(import ../npins).home-manager}/nix-darwin"
  ];
  environment.systemPackages = with pkgs; [
    hello
  ];
  system.stateVersion = 6;
  nix.enable = false;

  users.users.will = {
    name = "will";
    home = "/Users/will";
  };

  home-manager.users.will =
    {
      imports = [
        ../home.nix
      ];
      dotfiles = {
        hostAttr = "mba-mac";
        location = "$HOME/Documents/Projects/dotfiles";
        neovim.enable = true;
        pi.enable = true;
        secrets.enable = true;
      };
    };
}
