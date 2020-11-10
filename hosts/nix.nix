{ pkgs, ... }:
import /home/will/doc/dotfiles/home.nix
{
  username = "will";
  homeDirectory = "/home/will";
  email = "will@willbadart.com";
  extraPackages = with pkgs; [
    calibre
    firefox
    signal-desktop
    tmux
    protonvpn-cli
  ];
  extraConfig = {
    services.syncthing.enable = true;
    services.unclutter.enable = true;

    systemd.user.services.neuron = let
      notesDir = "/home/will/doc/zettelkasten";
      # See "Declarative Install"
      neuron = (
        let neuronRev = "master";
            neuronSrc = builtins.fetchTarball "https://github.com/srid/neuron/archive/${neuronRev}.tar.gz";
         in import neuronSrc {});
    in {
      Unit.Description = "Neuron zettelkasten service";
      Install.WantedBy = [ "graphical-session.target" ];
      Service = {
        ExecStart = "${neuron}/bin/neuron -d ${notesDir} rib -wS";
      };
    };

  };
}
{ pkgs = pkgs; }
