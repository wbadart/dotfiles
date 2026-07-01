{ pkgs, ... }:
{
  services.syncthing = {
    enable = true;
    overrideDevices = false;
    overrideFolders = false;
  };
  home.packages = with pkgs; [
    syncthing-macos
  ];
}
