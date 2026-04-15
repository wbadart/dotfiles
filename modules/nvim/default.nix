{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    initLua = builtins.readFile ./init.lua;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    withPython3 = false;
    withRuby = false;

    plugins = with pkgs.vimPlugins; [
      fzf-lua
      nvim-treesitter.withAllGrammars
      nvim-web-devicons
      vim-fugitive
      vim-gitgutter
      vim-repeat
      vim-surround
      vim-unimpaired
    ];
  };

  # fzf-lua dependencies
  programs.bat.enable = true;
  programs.delta.enable = true;
  programs.fd.enable = true;
  programs.fzf.enable = true;
  programs.ripgrep.enable = true;

  xdg.configFile."nvim/ftplugin".source = ./ftplugin;
}
