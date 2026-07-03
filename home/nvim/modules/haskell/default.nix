{
  config,
  lib,
  pkgs,
  ...
}:
lib.mkIf (!config.wb.neovim.disable) {
  programs.neovim = {
    initLua = ''
      vim.lsp.enable 'hls'
    '';
    plugins = [
      (pkgs.vimUtils.buildVimPlugin {
        name = "haskell-config";
        src = ./.;
      })
    ];
  };
}
