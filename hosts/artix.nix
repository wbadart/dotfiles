import ../home.nix
{
  username = "will";
  homeDirectory = "/home/will";
  email = "will@willbadart.com";
  extraConfig = {
    services.syncthing.enable = true;
  };
}
