-- Global keys
-- ==========
vim.g.mapleader = ' '
vim.keymap.set('i', 'jk', '<Esc>')

local fzf = require 'fzf-lua'
vim.keymap.set('n', '<Leader>sf', fzf.files)
vim.keymap.set('n', '<Leader>sg', fzf.live_grep)
vim.keymap.set('n', '<C-p>', fzf.global)

-- Search
-- ==========
vim.keymap.set('n', '<Esc>', ':noh<CR>')
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wildmenu = true

-- Appearance
-- ==========
vim.cmd.colorscheme 'unokai'
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 3

vim.cmd 'syntax off'  -- defer to treesitter
require('nvim-treesitter.configs').setup {
  highlight = { enable = true },
  indent = { enable = true },
}
