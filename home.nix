{ pkgs, config, ... }:
{
  imports = [
    ./hosts/current/home.nix
  ];

  home = {
    sessionPath = [
      "$HOME/.local/bin"
      "$HOME/.local/miniconda3/bin"
    ];
    sessionVariables = {
      EDITOR = "nvim";
      GNUPGHOME="$HOME/.config/gnupg";
      LEDGER_FILE = "$HOME/Documents/ledger/APR2021.journal";
      STOCKS_EXCLUDE = "USD|LifePath|Put|Call|ETH|BTC|BRK.B|NT_HRS|Index";
    } // (if builtins.pathExists ./secrets.nix then import ./secrets.nix else {});

    packages = with pkgs; [
      cachix
      curlie
      dhall-lsp-server
      entr
      exa
      fd
      hledger
      hugo
      mosh
      neuron-notes
      nmap
      pandoc
      procs
      ripgrep
      texlive.combined.scheme-full
      haskellPackages.lhs2tex
      tokei
      universal-ctags
      watch
      haskellPackages.stack
      haskell-language-server
      ormolu
      python39Packages.poetry
    ];
  };

  programs.bat.enable = true;
  programs.gpg.enable = true;
  programs.htop.enable = true;
  programs.jq.enable = true;

  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      SimpylFold
      coc-css
      coc-html
      coc-json
      coc-markdownlint
      coc-metals
      coc-nvim
      coc-rls
      fzf-vim
      goyo-vim
      lightline-vim
      neuron-vim
      stan-vim
      unicode-vim
      vim-colorschemes
      vim-commentary
      vim-cue
      vim-fugitive
      vim-gitgutter
      vim-polyglot
      vim-repeat
      vim-surround
      vimtex
    ];
    extraConfig = builtins.readFile ./config/init.vim;
    withNodeJs = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
  };

  programs.fzf = {
    enable = true;
    enableFishIntegration = true;
    changeDirWidgetCommand = "fd --type d";
    fileWidgetCommand = "fd --type f";
  };

  programs.git = {
    enable = true;
    aliases = {
      lol = "log --graph --oneline --all --decorate";
    };
    delta = {
      enable = true;
      options = {
        features = "side-by-side line-numbers decorations";
      };
    };
    lfs = { enable = true; };
    signing = {
      signByDefault = true;
      key = "B1B7F6AF530849E66D9AD057C0BFCABCFFB2398B";
    };
    userName = "Will Badart";
    extraConfig = {
      core.editor = "nvim";
    };
  };

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
  };
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      starship init fish | source
      set fish_greeting
      set --global --export GPG_TTY (tty)
    '';
    shellAliases = {
      cat = "bat";
      curl = "curlie";
      tree = "exa -T";
      grep = "rg";
      timeit = "hyperfine";
      ls = "exa --git";
      ps = "procs";
      l = "exa -l --git";
      ll = "exa -al --git";
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
      he = "cd (dirname $LEDGER_FILE) && nvim +Files && cd -";
      v = "nvim +GFiles";
      vim = "nvim";
      vc = "cd $HOME/Documents/dotfiles && nvim +Files && cd -";
    };
  };

  programs.direnv = {
    enable = true;
    enableFishIntegration = true;
    enableNixDirenvIntegration = true;
    stdlib = ''
      layout_poetry() {
        local VENV="$(dirname "$(poetry run which python)")"
        PATH_add "$VENV"
        export VIRTUAL_ENV="$(dirname "$VENV")"
        export POETRY_ACTIVE=1
      }
      '';
  };

  programs.tmux = {
    enable = true;
    clock24 = true;
    keyMode = "vi";
    terminal = "xterm-256color";
    extraConfig = builtins.readFile ./config/tmux.conf;
  };

  programs.home-manager.enable = true;
  home.stateVersion = "20.09";
}
