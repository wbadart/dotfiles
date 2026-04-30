{ config, lib, pkgs, ... }:
{
  imports = [
    ./modules/haskell
    ./modules/lua
    ./modules/misc
    ./modules/nix
  ];

  options.dotfiles.neovim.enable = lib.mkEnableOption "dotfiles' neovim config";

  config = lib.mkIf config.dotfiles.neovim.enable {
    programs.neovim = {
      enable = true;
      defaultEditor = true;
      extraLuaConfig = builtins.readFile ./init.lua;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;
      withPython3 = false;
      withRuby = false;

      plugins = with pkgs.vimPlugins; [
        catppuccin-nvim
        fzf-lua
        nvim-treesitter.withAllGrammars
        nvim-web-devicons
        oil-nvim
        vim-fugitive
        vim-gitgutter
        vim-repeat
        vim-surround
        vim-unimpaired

        (pkgs.vimUtils.buildVimPlugin {
          name = "auto-dark-mode.nvim";
          src = pkgs.fetchFromGitHub {
            repo = "auto-dark-mode.nvim";
            owner = "f-person";
            rev = "main";
            sha256 = "sha256-xTgRyct3L6Gcz/vdYSc+h2IUgi/+Lh1Q4mxJwHISeis=";
          };
        })
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
