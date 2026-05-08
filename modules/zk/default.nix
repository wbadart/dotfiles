{ lib, pkgs, ... }:
let
  notebook = "/home/will/Documents/Notes";
in
{
  programs.zk = {
    enable = true;
    settings = {
      notebook.dir = notebook;
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
    run mkdir -p ${notebook}
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
