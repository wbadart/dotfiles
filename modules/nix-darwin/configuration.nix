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
      pkgs.hugo
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
  } // (if builtins.pathExists ./secrets.nix then import ./secrets.nix else {});

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  nix.package = pkgs.nix;

  programs.vim.package = pkgs.neovim.override {
    configure = {
      packages.darwin.start = with pkgs.vimPlugins; [
        fzf-vim
        jq-vim  # not included in polyglot :(
        lightline-vim
        vim-colorschemes
        vim-commentary
        vim-fugitive
        vim-gitgutter
        vim-polyglot
        vim-surround
      ];
      customRC = ''
        colorscheme molokai
        set expandtab
        set hidden nobackup nowritebackup noswapfile
        set number relativenumber scrolloff=5
        set smartcase hlsearch incsearch wildmenu
        autocmd BufNewFile,BufReadPost *.{md,tex} set colorcolumn=79 tw=79 spell
        autocmd BufNewFile,BufReadPost COMMIT_EDITMSG set spell
        let g:netrw_liststyle=3  " tree
        let mapleader = ','
        inoremap jk <Esc>
        nnoremap <C-H> <C-W><C-H>
        nnoremap <C-J> <C-W><C-J>
        nnoremap <C-K> <C-W><C-K>
        nnoremap <C-L> <C-W><C-L>
        nnoremap <Leader><Leader> :G<CR>
        nnoremap <C-P> :Files<CR>
      '';
    };
  };

  programs.bash.enable = true;
  programs.fish.enable = true;
  programs.zsh.enable = true;
}
