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
      "$HOME/.local/sbin"
      "$HOME/.local/miniconda3/bin"
    ];
    sessionVariables = {
      EDITOR = "nvim";
    } // importIfExists ./secrets.nix {};

    packages = with pkgs; [
      cachix
      duckdb
      entr
      eza
      fd
      helix
      hugo
      jq jiq
      #j
      magic-wormhole
      mosh
      nmap
      poetry
      ripgrep
      watch
    ];
  };

  programs.bat.enable = true;
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
      neuron-nvim
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
    changeDirWidgetCommand = "${pkgs.fd}/bin/fd --type d";
    fileWidgetCommand = "${pkgs.fd}/bin/fd --type f";
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
      zoxide init fish | source
      '';
    loginShellInit = ''
      if [ -z "$SSH_AUTH_SOCK" ];
        eval (ssh-agent -c) >/dev/null
      end
      if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ];
        exec sway
      end
    '';
    shellAliases = {
      cat = "bat";
      tree = "exa -T --group-directories-first";
      ls = "exa --git";
      l = "exa -l --git --group-directories-first";
      ll = "exa -al --git --group-directories-first";
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
