{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nixd
  ];

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
}
