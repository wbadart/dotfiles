{ pkgs, ... }:
{
  programs.neovim.plugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "misc-config";
      src = ./.;
    })
  ];
}
