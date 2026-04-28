{ config, pkgs, ... }:
let
  prices-sh = pkgs.callPackage ../scripts/prices.nix {
    ALPHAVANTAGE_API_KEY =
      if config.dotfiles.secrets.enable
        then config.age.secrets.ALPHAVANTAGE_API_KEY.path
        else "/dev/null";
  };
in
{
  home.packages = with pkgs; [
    hledger
    prices-sh
  ];

  home.shellAliases = {
    h = "hledger -V --pretty";
  };

  home.sessionVariables = {
    LEDGER_FILE = "/home/will/Documents/Ledger/2026/202604.journal";
  };

  age.secrets.ALPHAVANTAGE_API_KEY.file = ../secrets/ALPHAVANTAGE_API_KEY.age;
}
