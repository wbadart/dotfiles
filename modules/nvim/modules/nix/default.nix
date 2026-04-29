{
  config,
  lib,
  pkgs,
  ...
}:
lib.mkIf config.dotfiles.neovim.enable {
  programs.neovim = {
    extraLuaConfig = ''
      vim.lsp.enable 'nixd'
    '';
    plugins = [
      (pkgs.vimUtils.buildVimPlugin {
        name = "nix-config";
        src = ./.;
      })
    ];
  };

  home.packages = with pkgs; [
    nixd
  ];
}
