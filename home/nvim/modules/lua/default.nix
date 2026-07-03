{
  config,
  lib,
  pkgs,
  ...
}:
lib.mkIf (!config.wb.neovim.disable) {
  programs.neovim = {
    initLua = ''
      vim.lsp.enable 'lua_ls'
    '';
    plugins = [
      (pkgs.vimUtils.buildVimPlugin {
        name = "lua-config";
        src = ./.;
      })
    ];
  };

  home.packages = with pkgs; [
    lua-language-server
  ];
}
