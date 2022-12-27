-- Set colorscheme
vim.o.termguicolors = true
vim.cmd [[colorscheme gruvbox-baby]]

vim.o.wrap = false
-- vim.o.nowrap = true

-- Set highlight on search
vim.o.hlsearch = true
vim.opt.spellfile = "/Users/charlie/.config/nvim/lua/dictionaries/es.utf-8.add"
-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.timeoutlen = 140

