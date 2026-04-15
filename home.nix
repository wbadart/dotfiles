let
  sources = import ./npins;
in
{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./modules/git.nix
    ./modules/hledger.nix
    ./modules/nix.nix
    ./modules/tmux
    ./modules/nvim
    ./modules/zsh.nix
    "${sources.agenix}/modules/age-home.nix"
  ];

  options.dotfiles = {
    location = lib.mkOption {
      type = lib.types.nullOr lib.types.str;
      description = "Path of dotfiles repo on disk";
      default = null;
    };
    hostAttr = lib.mkOption {
      type = lib.types.nullOr lib.types.str;
      description = "Attribute in default.nix pointing to this system's config";
      default = null;
    };
  };

  config = {
    xdg.enable = true;
    home.preferXdgDirectories = true;

    home.stateVersion = lib.mkDefault "26.05";
    programs.home-manager = {
      enable = true;
      path = lib.mkDefault "${sources.home-manager}";
    };

    home.shellAliases =
      let
        host = config.dotfiles.hostAttr;
        location = config.dotfiles.location;
        nom = "--log-format internal-json 2> >(${lib.getExe pkgs.nix-output-monitor} --json)";
        pkgsExpr = "import (import ${location}/npins).nixpkgs {}";
      in
      lib.mkIf (host != null && location != null) {
        hm = ''home-manager -f ${location} -A ${host} --arg pkgs "${pkgsExpr}"'';
        hmb = ''home-manager build -f ${location} -A ${host} --arg pkgs "${pkgsExpr}" ${nom}'';
        hms = ''home-manager switch -f ${location} -A ${host} --arg pkgs "${pkgsExpr}" ${nom}'';
        hmn = ''home-manager news -f ${location} -A ${host} --arg pkgs "${pkgsExpr}"'';
      };
  };
}
