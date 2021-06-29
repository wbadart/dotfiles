{ config, pkgs, ... }:
{
  services = {
    xserver = {
      enable = true;
      layout = "us";
      libinput.enable = true;
      displayManager.gdm.enable = true;
      # displayManager.defaultSession = "none+xmonad";
      # displayManager.autoLogin.enable = true;
      # displayManager.autoLogin.user = "will";
      desktopManager.gnome = {
        enable = true;
        # flashback = {
        #   enableMetacity = true;
        #   customSessions = [ {
        #     wmCommand = "${pkgs.haskellPackages.xmonad}/bin/xmonad}";
        #     wmLabel = "XMonad";
        #     wmName = "xmonad";
        #   } ];
        # };
      };
    };
  };

  environment.systemPackages = with pkgs; [
    firefox
    gnome3.gnome-tweak-tool
    xsel
  ];

  fonts.fonts = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
  ];
}
