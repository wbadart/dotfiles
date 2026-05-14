{
  config,
  lib,
  pkgs,
  ...
}:
let
  notebook = config.programs.zk.settings.notebook.dir;
in
{
  programs.zk = {
    enable = true;
    settings = {
      notebook.dir = "${config.home.homeDirectory}/Documents/Notes";
      tool.fzf-preview = "${lib.getExe pkgs.bat} -p --color always {-1}";

      alias.daily = ''zk new --no-input "$ZK_NOTEBOOK_DIR/daylies"'';
      group.daily = {
        paths = [ "daylies" ];
        note = {
          filename = "{{format-date now '%Y-%m-%d'}}";
          extension = "md";
          template = pkgs.writeText "daily.md" ''
            # {{format-date now '%Y-%m-%d (%a)'}}

          '';
        };
      };
    };
  };

  home.activation.ensureNotebookDir = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    run mkdir -p "${notebook}"
    run test -d "${notebook}/.zk" \
      || ${lib.getExe pkgs.zk} init --no-input "${notebook}"
  '';

  home.shellAliases = {
    zkd = "zk daily";
    zke = "zk edit --interactive";
  };

  home.sessionVariables.ZK_NOTEBOOK_DIR = notebook;

  programs.neovim = {
    extraLuaConfig = ''
      vim.g.mapleader = ' '
      vim.lsp.enable 'zk-nvim'
      require('zk').setup({
        picker = 'fzf_lua',
      })
      vim.keymap.set('n', '<leader>zk', "<Cmd>ZkNotes<CR>")
      vim.keymap.set('n', '<leader>zt', "<Cmd>ZkTags<CR>")
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
