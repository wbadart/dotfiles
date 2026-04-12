{ config, ... }:
{
  programs.zsh = {
    enable = true;
    autocd = true;
    autosuggestion.enable = true;
    defaultKeymap = "viins";
    dotDir = "${config.xdg.configHome}/zsh";
    history.append = true;
    history.share = false;
    syntaxHighlighting.enable = true;
  };

  home.shellAliases = {
    l = "eza -l";
    ll = "eza -la";
    ls = "eza";
    lt = "eza --tree";
  };

  programs.eza = {
    enable = true;
    git = true;
    icons = "always";
    extraOptions = [
      "--group-directories-first"
    ];
  };

  programs.starship.enable = true;
  programs.zoxide.enable = true;
}
