# host-specific-config is an attribute set that must include:
# - username
# - homeDirectory
# - email (default: will (at) willbadart (dot) com)
# - hmPath
hostConfig:
{ config, pkgs, ... }:
{
  home = {
    username = hostConfig.username;
    homeDirectory = hostConfig.homeDirectory;
    sessionVariables = {
      PATH = "$HOME/.local/bin:$PATH";
      LEDGER_FILE = "$HOME/.config/ledger/OCT2020.journal";
      STOCKS_EXCLUDE = "USD|LifePath|Put|Call|ETH|BTC|BRK.B";
      GNUPGHOME = "$HOME/.config/gnupg";
      EDITOR = "nvim";
    } // (if builtins.pathExists ./secrets.nix then import ./secrets.nix else {});
    packages = with pkgs; [
      dhall-lsp-server
      exa
      fd
      hledger
      hugo
      imagemagick
      mosh
      nmap
      ripgrep
      sloc
      starship
      universal-ctags
      watch
      haskellPackages.stack
      elmPackages.elm
      python38Packages.poetry
      rustup
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
      coc-nvim
      coc-rls
      fzf-vim
      goyo-vim
      lightline-vim
      vim-colorschemes
      vim-commentary
      vim-fugitive
      vim-gitgutter
      vim-polyglot
      vim-repeat
      vim-surround
      vimtex
    ];
    extraConfig = builtins.readFile ./config/init.vim;
    withNodeJs = true;
    extraPython3Packages = (pythonPackages: with pythonPackages; [ jedi ]);
  };

  programs.fzf = {
    enable = true;
    enableFishIntegration = true;
    enableZshIntegration = true;
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
    userEmail = hostConfig.email or "will@willbadart.com";
    userName = "Will Badart";
    extraConfig = {
      core.editor = "nvim";
    };
  };

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      starship init fish | source
      set fish_greeting
    '';
    shellAliases = {
      cat = "bat";
      tree = "exa -T";
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
      he = "cd $HOME/.config/ledger && nvim +Files && cd -";
      ls = "exa --git";
      l = "exa -l --git";
      ll = "exa -al --git";
      v = "nvim +GFiles";
      vim = "nvim";
      vc = "cd $HOME/Documents/dotfiles && nvim +Files && cd -";
    };
  };

  programs.zsh = {
    enable = true;
    initExtra = ''
      if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then
        . $HOME/.nix-profile/etc/profile.d/nix.sh;
      fi
      exec fish --login --interactive
    '';
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
