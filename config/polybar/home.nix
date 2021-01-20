{ pkgs, ... }:
{
  services.polybar = {
    enable = true;
    package = pkgs.polybar.override {
      alsaSupport = true;
      mpdSupport = true;
      pulseSupport = true;
    };
    extraConfig = builtins.readFile ./themes/simple/docky/config.ini;
    script = "polybar main &";
  };
}
