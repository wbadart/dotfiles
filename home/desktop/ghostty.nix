{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.wb.ghostty;
in
{
  options.wb.ghostty.disable =
    let
      inherit (lib) types;
    in
    lib.mkOption {
      type = types.bool;
      default = config.wb.desktop.disable;
      defaultText = lib.literalExpression "config.wb.desktop.disable";
      example = true;
      description = "Whether to disable Gostty";
    };

  config = lib.mkIf (!cfg.disable) {
    programs.ghostty = {
      enable = true;
      package = pkgs.ghostty-bin;
      settings = {
        theme = "dark:Catppuccin Mocha,light:Catppuccin Latte";
        mouse-hide-while-typing = true;
        keybind = [
          "cmd+h=goto_split:left"
          "cmd+j=goto_split:down"
          "cmd+k=goto_split:up"
          "cmd+l=goto_split:right"

          "cmd+shift+h=new_split:left"
          "cmd+shift+j=new_split:down"
          "cmd+shift+k=new_split:up"
          "cmd+shift+l=new_split:right"

          "super+z=toggle_split_zoom"
          "global:cmd+shift+backquote=toggle_quick_terminal"
        ];
      };
    };
  };
}
