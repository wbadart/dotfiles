{ config, pkgs, ... }:

{
  # Use a custom configuration.nix location.
  # $ darwin-rebuild switch -I darwin-config=$HOME/.config/nixpkgs/darwin/configuration.nix
  environment.darwinConfig = "$HOME/Documents/dotfiles/modules/nix-darwin/configuration.nix";

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages =
    [ config.programs.vim.package
      pkgs.fish
      pkgs.fzf
      pkgs.gnupg
      pkgs.hledger
      pkgs.jq
      pkgs.python38Packages.poetry
    ];

  environment.shellAliases = {
    g = "git";
    ga = "git add";
    gb = "git branch";
    gc = "git commit -v";
    gca = "git commit -av";
    gcb = "git checkout -b";
    gcl = "git clone --recursive";
    gco = "git checkout";
    gd = "git diff";
    gdc = "git diff --cached";
    gf = "git fetch";
    gl = "git pull";
    gp = "git push";
    gr = "git remote";
    gst = "git status";
    h = "hledger -V";
    he = ''
      cd /Users/williambadart/.config/ledger \
        && vim /Users/williambadart/.config/ledger/JUN2020.journal \
        && cd -
    '';
    v = "nvim +Files";
    vim = "nvim";
  };

  environment.variables = {
    EDITOR = "nvim";
    GNUPGHOME = "$HOME/.config/gnupg";
    LEDGER_FILE = "$HOME/.config/ledger/JUN2020.journal";
    STOCKS_EXCLUDE = "USD|LifePath|Put|Call|ETH|BTC";
  };

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  nix.package = pkgs.nix;

  programs.vim.package = pkgs.neovim.override {
    configure = {
      packages.darwin.start = with pkgs.vimPlugins; [
        fzf-vim
        lightline-vim
        vim-colorschemes
        vim-commentary
        vim-polyglot
        vim-surround
      ];
      customRC = ''
        colorscheme molokai
        inoremap jk <esc>
        nnoremap <c-p> :Files<cr>
        set number relativenumber scrolloff=5
        set expandtab
        set smartcase hlsearch incsearch wildmenu
        set noswapfile
      '';
    };
  };

  programs.bash.enable = true;
  programs.fish.enable = true;
  programs.zsh.enable = true;
}
