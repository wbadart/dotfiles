let
  sources = import ../npins;
in
{
  imports = [
    "${sources.home-manager}/nix-darwin"
  ];

  system.stateVersion = 6;
  nix.enable = false;

  users.users.will = {
    name = "will";
    home = "/Users/will";
  };

  nixpkgs.config = {
    allowUnfree = true;
  };

  security.pam.services.sudo_local.touchIdAuth = true;

  services.openssh = {
    enable = true;
    extraConfig = ''
      AuthenticationMethods publickey
    '';
  };
  # TODO: users.users.will.authorizedKeys
  # TODO: networking.applicationFirewall?

  home-manager = {
    users.will = { pkgs, ... }: {
      imports = [
        ../home.nix
        ../modules/desktop
      ];
      dotfiles = {
        hostAttr = "mba-mac";
        location = "$HOME/Documents/Projects/dotfiles";
        InstantSpaceSwitcher.enable = true;
        ghostty.enable = true;
        kdeconnect.enable = true;
        neovim.enable = true;
        pi.enable = true;
        rectangle.enable = true;
        secrets.enable = true;
      };
      age.identityPaths = [ "/home/will/.ssh/id_ed25519" ];
      home.sessionSearchVariables.MANPATH = [
        "${pkgs.nix.man}/share/man"
      ];
    };

    backupFileExtension = ".bak";
  };
}
