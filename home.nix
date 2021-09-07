let importIfExists = path: default: if builtins.pathExists path then import path else default;
in
{ pkgs, config, ... }:
{
  imports = [
    ./hosts/current/home.nix
  ];

  home = {
    sessionPath = [
      "$HOME/.local/bin"
    ];
    sessionVariables = {
      EDITOR = "nvim";
    } // importIfExists ./secrets.nix {};

    packages = with pkgs; [
      cachix
      # curlie
      # dhall-lsp-server
      # haskell-language-server
      # haskellPackages.lhs2tex
      # haskellPackages.stack
      # ormolu
      # pandoc
      # procs
      # texlive.combined.scheme-full
      # tokei
      # universal-ctags
      entr
      exa
      fd
      hugo
      j
      mosh
      nmap
      python39Packages.poetry
      ripgrep
      watch
    ];
  };

  programs.bat.enable = true;
  programs.htop.enable = true;
  programs.jq.enable = true;

  programs.lazygit = {
    enable = true;
    settings = {
      allBranchesLogCmd = "git log --all --graph --oneline --color=always --abbrev-commit --decorate --date=relative --pretty=medium {{branchName}}";
      branchLogCmd = "git log --graph --oneline --color=always --abbrev-commit --decorate --date=relative --pretty=medium {{branchName}}";
    };
  };

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
        features = "line-numbers decorations";
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
      init.defaultBranch = "master";
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
      tree = "exa -T --group-directories-first";
      grep = "rg";
      timeit = "hyperfine";
      ls = "exa --git";
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
      gf = "git fetch --prune";
      gl = "git pull";
      gp = "git push";
      gr = "git remote";
      gst = "git status";
      h = "hledger -V";
      he = "cd (dirname $LEDGER_FILE) && nvim +Files && cd -";
      j = "jconsole";
      t = "tmux";
      tn = "tmux new -s (basename $PWD)";
      ta = "tmux a -t";
      v = "nvim +GFiles";
      vim = "nvim";
      vc = "cd $HOME/Documents/dotfiles && nvim +Files && cd -";
    };
  };

  programs.direnv = {
    enable = true;
    enableFishIntegration = true;
    nix-direnv.enable = true;
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
