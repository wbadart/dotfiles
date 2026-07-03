{ config, ... }:
{
  imports = [ ../darwin ];
  environment.darwinConfig = "${config.users.users.will.home}/Documents/Projects/dotfiles/hosts/mba.nix";

  users.users.will = {
    name = "will";
    home = "/Users/will";
  };

  home-manager = {
    users.will = { pkgs, ... }: {
      imports = [ ../home ];
      wb.secrets.enable = true;
      age.identityPaths = [ "/home/will/.ssh/id_ed25519" ];
      home.sessionSearchVariables.MANPATH = [
        "${pkgs.nix.man}/share/man"
      ];
      home.stateVersion = "26.05";
    };
  };

  system.stateVersion = 6;
  nix.enable = false; # Using Determinate
}
