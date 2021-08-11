{ pkgs, config, ... }:
{
  imports = [
    ../../modules/hledger.nix
  ];

  home = {
    username = "will";
    homeDirectory = "/home/will";
    packages = with pkgs; [
      calibre
      chromium
      niv
      transmission
      signal-desktop
      protonvpn-cli
      protonvpn-gui
      unzip
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
}
