{
  config,
  lib,
  pkgs,
  ...
}:
lib.mkIf (!config.wb.neovim.disable) {
  programs.neovim.plugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "misc-config";
      src = ./.;
    })
  ];
}
