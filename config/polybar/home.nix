{ pkgs, ... }:
{
  services.polybar = {
    enable = true;
    package = pkgs.polybar.override {
      alsaSupport = true;
      mpdSupport = true;
      pulseSupport = true;
    };
    extraConfig = builtins.readFile ./config.ini;
    script = "polybar main &";
  };
}
