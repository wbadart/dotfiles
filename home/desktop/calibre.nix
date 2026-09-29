inputs:
{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.wb.calibre;
  configDir = "${config.xdg.configHome}/calibre";

  dedrm = pkgs.runCommand "calibre-plugin-dedrm" { nativeBuildInputs = [ pkgs.unzip ]; } ''
    mkdir -p $out
    unzip -p ${inputs.dedrm} DeDRM_plugin.zip > $out/DeDRM.zip
  '';
  deacsm = pkgs.runCommand "calibre-plugin-deacsm" { } ''
    mkdir -p $out
    cp ${inputs.deacsm} $out/DeACSM.zip
  '';

  # Calibre only loads plugins registered by name in customize.py.json; it
  # doesn't scan plugins/, so dropping the zips in place isn't enough.
  registeredPlugins = builtins.toJSON {
    DeDRM = "${configDir}/plugins/DeDRM.zip";
    DeACSM = "${configDir}/plugins/DeACSM.zip";
  };
in
{
  options.wb.calibre.disable =
    let
      inherit (lib) types;
    in
    lib.mkOption {
      type = types.bool;
      default = config.wb.desktop.disable;
      defaultText = lib.literalExpression "config.wb.desktop.disable";
      example = true;
      description = "Whether to disable calibre";
    };

  config = lib.mkIf (!cfg.disable) {
    programs.calibre = {
      enable = true;
      package = pkgs.stdenvNoCC.mkDerivation (self: {
        pname = "calibre-bin";
        version = "9.15.0";
        src = pkgs.fetchurl {
          url = "https://download.calibre-ebook.com/${self.version}/calibre-${self.version}.dmg";
          hash = "sha256-Gzp0URdbc64rqij+G8HFPuNNZbSJiB5+wCwg+eD/YBk=";
        };
        nativeBuildInputs = [ pkgs.undmg ];
        installPhase = ''
          runHook preInstall
          mkdir -p "$out/Applications"
          cp -r *.app "$out/Applications"
          runHook postInstall
        '';
        meta.platforms = lib.platforms.darwin;
      });
      plugins = [
        dedrm
        deacsm
      ];
    };

    # programs.calibre writes to $XDG_CONFIG_HOME/calibre, but calibre on macOS
    # reads ~/Library/Preferences/calibre.
    home.file."Library/Preferences/calibre" = lib.mkIf pkgs.stdenv.hostPlatform.isDarwin {
      source = config.lib.file.mkOutOfStoreSymlink configDir;
    };

    home.activation = {
      calibreRegisterPlugins = lib.hm.dag.entryAfter [ "linkGeneration" ] ''
        f=${lib.escapeShellArg "${configDir}/customize.py.json"}
        old=$(cat "$f" 2>/dev/null || echo '{}')
        new=$(${lib.getExe pkgs.jq} --argjson p ${lib.escapeShellArg registeredPlugins} \
          '.plugins = (.plugins // {}) + $p' <<<"$old")
        if [[ "$old" != "$new" ]]; then
          run mkdir -p ${lib.escapeShellArg configDir}
          if [[ ! -v DRY_RUN ]]; then printf '%s\n' "$new" > "$f"; fi
        fi
      '';

      # The DeACSM account (and DeDRM's copy of its key) is mutable state:
      # DeACSM rewrites activation.xml whenever it meets a new book distributor.
      # So decrypt it once as a seed instead of managing it with age.secrets,
      # which would replace it on every login.
      calibreSeedDrmAccount = lib.mkIf config.wb.secrets.enable (
        lib.hm.dag.entryAfter [ "linkGeneration" ] ''
          if [[ ! -e ${lib.escapeShellArg "${configDir}/plugins/DeACSM/account/activation.xml"} ]]; then
            ids=()
            for i in ${lib.escapeShellArgs config.age.identityPaths}; do
              if [[ -r "$i" ]]; then ids+=(-i "$i"); fi
            done
            run mkdir -p ${lib.escapeShellArg configDir}
            if [[ ! -v DRY_RUN ]]; then
              ${lib.getExe config.age.package} -d "''${ids[@]}" ${../../secrets/calibre-drm.tar.age} \
                | ${lib.getExe pkgs.gnutar} -C ${lib.escapeShellArg configDir} --skip-old-files -xf -
            fi
          fi
        ''
      );
    };
  };
}
