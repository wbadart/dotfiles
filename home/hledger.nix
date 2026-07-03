{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.wb.hledger;
  prices-sh = pkgs.callPackage ../scripts/prices.nix {
    ALPHAVANTAGE_API_KEY =
      if config.wb.secrets.enable then config.age.secrets.ALPHAVANTAGE_API_KEY.path else "/dev/null";
  };
in
{
  options.wb.hledger.disable =
    let
      inherit (lib) types;
    in
    lib.mkOption {
      type = types.bool;
      default = false;
      example = true;
      description = "Whether to disable hledger";
    };

  config = lib.mkIf (!cfg.disable) {
    home.packages = with pkgs; [
      hledger
      prices-sh
    ];

    home.shellAliases = {
      h = "hledger -V --pretty --pager=n";
    };

    home.sessionVariables = {
      LEDGER_FILE = "${config.home.homeDirectory}/Documents/Ledger/2026/202607.journal";
    };

    age.secrets.ALPHAVANTAGE_API_KEY.file = ../secrets/ALPHAVANTAGE_API_KEY.age;
  };
}
