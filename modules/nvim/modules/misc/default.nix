{
  config,
  lib,
  pkgs,
  ...
}:
lib.mkIf config.dotfiles.neovim.enable {
  programs.neovim.plugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "misc-config";
      src = ./.;
    })
  ];
}
