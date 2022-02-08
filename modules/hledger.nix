{ pkgs, config, ... }:
{
  home = {
    packages = with pkgs; [
      hledger
    ];
    sessionVariables = {
      LEDGER_FILE =
        assert config.home.sessionVariables?LEDGER_DIR;
        "${config.home.sessionVariables.LEDGER_DIR}/2022/02-2022.journal";
      STOCKS_EXCLUDE = "USD|LifePath|Put|Call|ETH|BTC|BRK.B|NT_HRS|Index";
    };
  };
}
