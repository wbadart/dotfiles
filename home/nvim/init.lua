-- Global keys
-- ==========
vim.g.mapleader = ' '
vim.keymap.set('i', 'jk', '<Esc>')

local fzf = require 'fzf-lua'
vim.keymap.set('n', '<Leader>s<space>', fzf.buffers, { desc = 'buffers' })
vim.keymap.set('n', '<Leader>sb', fzf.buffers, { desc = 'buffers' })
vim.keymap.set('n', '<Leader>sd', fzf.diagnostics_workspace, { desc = 'diagnostics' })
vim.keymap.set('n', '<Leader>sf', fzf.files, { desc = 'files' })
vim.keymap.set('n', '<Leader>sg', fzf.live_grep, { desc = 'live grep' })
vim.keymap.set('n', '<C-p>', fzf.global, { desc = 'global' })

-- Search
-- ==========
vim.keymap.set('n', '<Esc>', ':noh<CR>')
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wildmenu = true

-- Appearance
-- ==========
vim.cmd.colorscheme 'catppuccin'
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 3

vim.opt.expandtab = true
vim.opt.smarttab = true

local ts = require 'nvim-treesitter'
vim.cmd 'syntax off'
vim.api.nvim_create_autocmd('FileType', {
  pattern = ts.get_available(),
  callback = function ()
    vim.treesitter.start()
  end
})

-- LSP
-- ==========
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function()
    vim.keymap.set('n', 'grd', fzf.lsp_definitions, { desc = 'definitions' });
    vim.keymap.set('n', 'grr', fzf.lsp_references, { desc = 'references' });
    vim.keymap.set('n', 'grf', vim.lsp.buf.format, { desc = 'format' });
    vim.keymap.set('n', 'grs', ':lsp restart<CR>', { desc = 'restart' });
  end
})

-- Misc.
-- ==========
require('oil').setup()
