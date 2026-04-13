{ pkgs, ... }:
{
  home.packages = with pkgs; [
    hledger
  ];

  home.shellAliases = {
    h = "hledger -V --pretty";
  };

  home.sessionVariables = {
    LEDGER_FILE = "/home/will/Documents/Ledger/2026/202604.journal";
  };
}
