{
  config,
  lib,
  pkgs,
  ...
}:
lib.mkIf (!config.wb.neovim.disable) {
  programs.neovim = {
    initLua = ''
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
    nixfmt
  ];
}
