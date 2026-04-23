{ pkgs, ... }:
{
  programs.neovim = {
    extraLuaConfig = ''
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
