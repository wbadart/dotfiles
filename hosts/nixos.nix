{ pkgs, ... }:
{
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
}
