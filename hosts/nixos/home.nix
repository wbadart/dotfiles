{ pkgs, config, ... }:
{
  imports = [
    ../../modules/hledger.nix
    ../../modules/emanote.nix
    ../../modules/neuron.nix
  ];

  home = {
    username = "will";
    homeDirectory = "/home/will";
    packages = with pkgs; [
      calibre
      chromium
      firefox
      nextcloud-client
      niv
      transmission
      signal-desktop
      protonvpn-cli
      # protonvpn-gui
      unzip

      # https://nixos.wiki/wiki/Sway
      # swaylock
      # swayidle
      # wl-clipboard
      # mako # notification daemon
      # dmenu # Dmenu is the default in the config but i recommend wofi since its wayland native
    ];
    sessionVariables = {
      LEDGER_DIR = "${config.home.homeDirectory}/Documents/ledger";
    };
  };

  programs.alacritty = {
    enable = true;
    # settings = {
    #   env.TERM = "alacritty";
    #   window = {
    #     padding = { x = 12; y = 0; };
    #   };
    #   font = {
    #     normal = {
    #       family = "FiraCode Nerd Font";
    #       style = "Medium";
    #     };
    #     size = 8;
    #     offset.y = 10;
    #     glyph_offset.y = 5;
    #   };
    # };
  };

  programs.git.userEmail = "will@willbadart.com";
  programs.git.signing.key = "B1B7F6AF530849E66D9AD057C0BFCABCFFB2398B";
  services.syncthing.enable = true;
  services.unclutter.enable = true;
  services.lorri.enable = true;

  systemd.user.services.neuron =
    let notesDir = "/home/will/Documents/Kasten";
        neuron = import ../../modules/neuron-pkg.nix;
    in {
      Unit.Description = "Neuron zettelkasten service";
      Install.WantedBy = [ "graphical-session.target" ];
      Service = {
        ExecStart = "${neuron}/bin/neuron -d ${notesDir} rib -wS";
      };
    };

    # wayland.windowManager.sway = {
    #   enable = true;
    #   wrapperFeatures.gtk = true ;
    # };
}
