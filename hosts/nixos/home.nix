{ pkgs, ... }:
{
  imports = [
    ../../config/polybar/home.nix
    ../../config/lockscreen/home.nix
  ];

  home = {
    username = "will";
    homeDirectory = "/home/will";
    sessionVariables = {
      LEDGER_FILE = "/home/will/Documents/ledger/JAN2021.journal";
    };
    packages = with pkgs; [
      signal-desktop
      protonvpn-cli
    ];
  };

  programs.rofi = {
    enable = true;
    terminal = "${pkgs.alacritty}/bin/alacritty";
    theme = builtins.fetchurl "https://raw.githubusercontent.com/davatorium/rofi/next/themes/sidebar.rasi";
  };

  programs.alacritty = {
    enable = true;
    settings = {
      env.TERM = "alacritty";
      window = {
        padding = { x = 12; y = 0; };
      };
      font = {
        normal = {
          family = "FiraCode Nerd Font";
          style = "Medium";
        };
        size = 8;
        offset.y = 10;
        glyph_offset.y = 5;
      };
    };
  };

  programs.git.userEmail = "will@willbadart.com";
  services.syncthing.enable = true;
  services.unclutter.enable = true;

  systemd.user.services.neuron =
    let notesDir = "/home/will/Documents/Kasten";
        neuron = pkgs.neuron-notes;
    in {
      Unit.Description = "Neuron zettelkasten service";
      Install.WantedBy = [ "graphical-session.target" ];
      Service = {
        ExecStart = "${neuron}/bin/neuron -d ${notesDir} rib -wS";
      };
    };

  services.picom = {
    enable = true;
    activeOpacity = "1.0";
    inactiveOpacity = "0.95";
    inactiveDim = "0.2";
    backend = "glx";
    fade = true;
    fadeDelta = 1;
    opacityRule = [ "100:name *= 'i3lock'" ];
    shadow = true;
    shadowOpacity = "0.75";
  };
}
