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
      home.sessionSearchVariables.MANPATH = [
        "/Users/will/.nix-profile/share/man"
        "/run/current-system/sw/share/man"
        "/usr/share/man"
        "/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/share/man"
        "/Library/Developer/CommandLineTools/usr/share/man"
        "/nix/store/n49nilx5qjfqmqn67pgzhn4k85nn8ars-determinate-nix-manual-3.19.0-man/share/man"
      ];
    };
}
