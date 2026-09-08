{ lib, config, ... }:
let
  ifSecrets = x: lib.mkIf config.wb.secrets.enable x;
in
{
  options.programs.zsh.wb.doProfile =
    let
      inherit (lib) types;
    in
    lib.mkOption {
      type = types.bool;
      default = false;
      example = true;
      description = "Whether to enable zsh startup profiling";
    };

  config =
    let
      cfg = config.programs.zsh.wb;
    in
    {
      programs.zsh = {
        enable = true;
        autocd = true;
        autosuggestion.enable = true;
        defaultKeymap = "viins";
        dotDir = "${config.xdg.configHome}/zsh";
        enableCompletion = true;
        enableVteIntegration = true;
        envExtra = ifSecrets ". ${config.age.secrets.env.path}";
        history.append = true;
        history.share = false;
        syntaxHighlighting.enable = true;

        # https://esham.io/2018/02/zsh-profiling
        initContent = lib.mkIf cfg.doProfile (
          let
            early = ''
              zmodload zsh/datetime
              setopt PROMPT_SUBST
              PS4='+$EPOCHREALTIME %N:%i> '

              logfile=$(mktemp zsh_profile.XXXXXXXX)
              echo "Logging to $logfile"
              exec 3>&2 2>$logfile

              setopt XTRACE
            '';
            late = ''
              unsetopt XTRACE
              exec 2>&3 3>&-
            '';
          in
          lib.mkMerge [
            (lib.mkOrder 10 early)
            (lib.mkOrder 9999 late)
          ]
        );
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
        da = "direnv allow";
        dr = "direnv reload";
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
        config.global = {
          hide_env_diff = true;
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

      age.secrets = ifSecrets {
        env.file = ../secrets/env.age;
      };
    };
}
