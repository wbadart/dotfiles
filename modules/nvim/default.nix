{ config, lib, pkgs, ... }:
{
  imports = [
    ./modules/lua
    ./modules/misc
    ./modules/nix
  ];

  options.dotfiles.neovim.enable = lib.mkEnableOption "dotfiles' neovim config";

  config = lib.mkIf config.dotfiles.neovim.enable {
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
        oil-nvim
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
  };
}
