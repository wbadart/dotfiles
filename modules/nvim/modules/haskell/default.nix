{ pkgs, ... }:
{
  programs.neovim = {
    extraLuaConfig = ''
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
