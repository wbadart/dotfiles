{ config, ... }:
let neuron = (import ./neuron-pkg.nix).default;
in {
  home.packages = [ neuron ];
  systemd.user.services.neuron =
    let notesDir =
          assert config.home.sessionVariables?KASTEN_DIR;
          config.home.sessionVariables.KASTEN_DIR;
    in {
      Unit.Description = "Neuron zettelkasten service";
      Install.WantedBy = [ "graphical-session.target" ];
      Service = {
        ExecStart = "${neuron}/bin/neuron -d ${notesDir} rib -ws 0.0.0.0:8080";
      };
    };
}
