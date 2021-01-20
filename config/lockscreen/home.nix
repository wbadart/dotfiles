{ pkgs, ... }:
{
  services.screen-locker = {
    enable = true;
    inactiveInterval = 30;
    lockCmd = "${pkgs.betterlockscreen}/bin/betterlockscreen -l dimblur -t 'Enter password to unlock'";
    xautolockExtraOptions = [
      "Xautolock.killer: systemctl suspend"
    ];
  };

  home.packages = with pkgs; [
    betterlockscreen
  ];
}
