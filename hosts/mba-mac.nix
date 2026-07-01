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

  home-manager = {
    users.will = {
      imports = [
        ../home.nix
        ../modules/desktop
      ];
      dotfiles = {
        hostAttr = "mba-mac";
        location = "$HOME/Documents/Projects/dotfiles";
        InstantSpaceSwitcher.enable = true;
        ghostty.enable = true;
        neovim.enable = true;
        pi.enable = true;
        rectangle.enable = true;
        secrets.enable = true;
      };
      age.identityPaths = [ "/home/will/.ssh/id_ed25519" ];
      home.sessionSearchVariables.MANPATH = [
        "/Users/will/.nix-profile/share/man"
        "/run/current-system/sw/share/man"
        "/usr/share/man"
        "/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/share/man"
        "/Library/Developer/CommandLineTools/usr/share/man"
        "/nix/store/n49nilx5qjfqmqn67pgzhn4k85nn8ars-determinate-nix-manual-3.19.0-man/share/man"
      ];
    };

    backupFileExtension = ".bak";
  };
}
