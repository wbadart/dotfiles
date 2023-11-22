{ config, pkgs, lib, ... }:
{
  services.xserver = {
    enable = true;
    layout = "us";
    libinput.enable = true;
    displayManager.gdm.enable = true;
    displayManager.defaultSession = "gnome";
    desktopManager.gnome.enable = true;
    #desktopManager.xterm.enable = false;
    #displayManager.defaultSession = "none+xmonad";
    windowManager.xmonad = {
        enable = true;
        enableContribAndExtras = true;
    };
    # windowManager.i3 = {
    #   enable = true;
    #   package = pkgs.i3-gaps;
    #   extraPackages = with pkgs; [
    #     dmenu
    #     i3status
    #     i3lock
    #     i3blocks
    #   ];
    # };
  };

  environment.systemPackages = with pkgs; [
    #firefox
    chromium
    dmenu
    # gnome.gnome-tweaks
    # gnomeExtensions.material-shell
    xsel

    xmobar
    alacritty
  ];
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
  ];
}
