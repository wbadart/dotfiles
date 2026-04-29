{
  config,
  lib,
  pkgs,
  ...
}:
lib.mkIf config.dotfiles.neovim.enable {
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
