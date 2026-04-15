{ config, ... }:
{
  programs.zsh = {
    enable = true;
    autocd = true;
    autosuggestion.enable = true;
    defaultKeymap = "viins";
    dotDir = "${config.xdg.configHome}/zsh";
    enableCompletion = true;
    enableVteIntegration = true;
    envExtra = ". ${config.age.secrets.env.path}";
    history.append = true;
    history.share = false;
    syntaxHighlighting.enable = true;
  };

  home.sessionPath = [
    "$HOME/.local/bin"
  ];

  home.shellAliases = {
    l = "eza -l";
    ll = "eza -la";
    ls = "eza";
    lt = "eza --tree";
    cat = "bat";
  };

  programs.eza = {
    enable = true;
    git = true;
    icons = "auto";
    extraOptions = [
      "--group-directories-first"
    ];
  };

  programs.nix-your-shell = {
    enable = true;
    nix-output-monitor.enable = true;
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    silent = true;
    config.global = {
      strict_env = true;
      warn_timeout = 0;
    };
  };

  programs.bat.enable = true;
  programs.fd.enable = true;
  programs.fzf.enable = true;
  programs.jq.enable = true;
  programs.jqp.enable = true;
  programs.ripgrep.enable = true;
  programs.starship.enable = true;
  programs.zoxide.enable = true;

  age.secrets.env.file = ../secrets/env.age;
}
