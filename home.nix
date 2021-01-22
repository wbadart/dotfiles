{ pkgs, config, ... }:
{
  imports = [
    ./hosts/current/home.nix
  ];

  home = {
    sessionVariables = {
      STOCKS_EXCLUDE = "USD|LifePath|Put|Call|ETH|BTC|BRK.B|NT_HRS";
      EDITOR = "nvim";
      LEDGER_FILE = "$HOME/Documents/ledger/JAN2021.journal";
      GNUPGHOME="$HOME/.config/gnupg";
    } // (if builtins.pathExists ./secrets.nix then import ./secrets.nix else {});

    packages = with pkgs; [
      cachix
      curlie
      exa
      fd
      hledger
      hugo
      mosh
      nmap
      procs
      ripgrep
      tokei
      universal-ctags
      watch
      haskellPackages.stack
      agda
      neuron-notes
    ];
  };

  programs.bat.enable = true;
  programs.gpg.enable = true;
  programs.htop.enable = true;
  programs.jq.enable = true;
  programs.texlive.enable = true;

  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      SimpylFold
      coc-metals
      coc-css
      coc-html
      coc-json
      coc-markdownlint
      coc-nvim
      coc-rls
      fzf-vim
      goyo-vim
      lightline-vim
      neuron-vim
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
    plugins = [
      {
        name = "fenv";
        src = pkgs.fetchFromGitHub {
          owner = "oh-my-fish";
          repo = "plugin-foreign-env";
          rev = "dddd9213272a0ab848d474d0cbde12ad034e65bc";
          sha256 = "00xqlyl3lffc5l0viin1nyp819wf81fncqyz87jx8ljjdhilmgbs";
        };
      }
    ];
    shellAliases = {
      cat = "bat";
      curl = "curlie";
      tree = "exa -T";
      grep = "rg";
      timeit = "hyperfine";
      find = "fd";
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
