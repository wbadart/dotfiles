import ../home.nix
{
  username = "will";
  homeDirectory = "/home/will";
  email = "will@willbadart.com";
  extraPackages = [  #with pkgs; [
    # calibre
    # entr
    # firefox
    # hledger
    # htop
    # signal-desktop
    # tmux
  ];
  extraConfig = {
    services.syncthing.enable = true;
    services.unclutter.enable = true;
  };
}
