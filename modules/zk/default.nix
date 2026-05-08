{
  config,
  lib,
  pkgs,
  ...
}:
{
  programs.zk = {
    enable = true;
    settings = {
      notebook.dir = "/home/will/Documents/Notes";
      tool.fzf-preview = "${lib.getExe pkgs.bat} -p --color always {-1}";

      alias.daily = ''zk new --no-input "$ZK_NOTEBOOK_DIR/daylies"'';
      group.daily = {
        paths = [ "daylies" ];
        note = {
          filename = "{{format-date now '%Y-%m-%d'}}";
          extension = "md";
          template = pkgs.writeText "daily.md" ''
            # {{format-date now "long"}}

          '';
        };
      };
    };
  };

  home.activation.ensureNotebookDir = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    run mkdir -p ${config.programs.zk.settings.notebook.dir}
  '';

  home.shellAliases = {
    zkd = "zk daily";
    zke = "zk edit --interactive";
  };

  programs.neovim = {
    extraLuaConfig = ''
      vim.lsp.enable 'zk-nvim'
    '';
    plugins = with pkgs.vimPlugins; [
      zk-nvim
      (pkgs.vimUtils.buildVimPlugin {
        name = "zk-config";
        src = ./nvim;
      })
    ];
  };
}
