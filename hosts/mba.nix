{
  imports = [
    ../home.nix
  ];

  home.username = "will";
  home.homeDirectory = "/home/will";

  home.shellAliases = {
    hm = "home-manager -f $HOME/Documents/dotfiles -A mba";
    hmb = "home-manager build -f $HOME/Documents/dotfiles -A mba";
    hms = "home-manager switch -f $HOME/Documents/dotfiles -A mba";
    hmn = "home-manager news -f $HOME/Documents/dotfiles -A mba";
  };
}
