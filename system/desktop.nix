{ config, pkgs, ... }:

{
  services = {
    gnome3.gnome-keyring.enable = true;
    upower.enable = true;

    dbus = {
      enable = true;
      packages = [ pkgs.gnome3.dconf ];
    };

    xserver = {
      enable = true;
      layout = "us";
      libinput.enable = true;
      displayManager.gdm.enable = true;
      displayManager.defaultSession = "none+xmonad";
      # displayManager.autoLogin.enable = true;
      # displayManager.autoLogin.user = "will";

      windowManager.xmonad = {
        enable = true;
        enableContribAndExtras = true;
        ghcArgs = [ "-Wall" ];
        config = ../config/xmonad.hs;
      };
    };
  };
  fonts.fonts = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
  ];


  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
  systemd.services.upower.enable = true;

  services.actkbd = {
    enable = true;
    bindings = [
      { keys = [ 232 ]; events = [ "key" ]; command = "/run/current-system/sw/bin/light -A 5"; }
      { keys = [ 233 ]; events = [ "key" ]; command = "/run/current-system/sw/bin/light -U 5"; }
    ];
  };
}
