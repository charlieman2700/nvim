vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })


-- u for undo is already default
-- S-U for redo / 
vim.keymap.set('n', '<S-u>', ':redo <cr>', { desc = 'Quit' })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Buffer Navigation
vim.keymap.set('n', '<S-l>', ":bnext <cr>", { desc = 'Go to next buffer'})
vim.keymap.set('n', '<S-h>', ":bprevious <cr>", { desc = 'Go to prev buffer'})

-- Neotree
vim.keymap.set('n', '<leader>e', ':Neotree toggle <CR>', { desc = 'Toggle Neotree' })

--Alpha
vim.keymap.set('n', '<leader>;', ':Alpha <CR>', { desc = 'Dashboard' })

-- Neovim Builtin
vim.keymap.set('n', '<leader>w', ':w <CR>', { desc = 'Save File' })
vim.keymap.set('n', '<leader>q', ':q <CR>', { desc = 'Quit' })
vim.keymap.set('n', '<ESC>', ':noh <CR>', { desc = 'No Highlights' })
vim.keymap.set('n', '<leader>c', ':bd <CR>', { desc = 'Close Buffer' })

-- "Virtual Text",
vim.keymap.set('n', '<leader>UU', ':lua vim.diagnostic.config({ virtual_text = false, underline = true, signs = false}) <cr>', { desc = 'Only underline' })
vim.keymap.set('n', '<leader>UB', ':lua vim.diagnostic.config({ virtual_text = false, underline = true, signs = true}) <cr>', { desc = 'Underline and Signs' })
vim.keymap.set('n', '<leader>US', ':lua vim.diagnostic.config({ virtual_text = false, underline = false, signs = true }) <cr>', { desc = 'Only Signs' })
vim.keymap.set('n', '<leader>UA', ':lua vim.diagnostic.config({ virtual_text = true, underline = true, signs = true }) <cr>', { desc = 'All' })

-- Packer
vim.keymap.set('n', '<leader>ps', ':PackerSync <CR>', { desc = 'Packer Sync' })

-- Moving between buffers
local smart_splits_available, smart_splits = pcall(require, 'smart-splits')
if smart_splits_available then
  -- Better window navigation
  vim.keymap.set('n', '<C-h>', smart_splits.move_cursor_left(), { desc = 'Move to left split' })
  vim.keymap.set('n', '<C-j>', smart_splits.move_cursor_down(), { desc = 'Move to below split' })
  vim.keymap.set('n', '<C-k>', smart_splits.move_cursor_up(), { desc = 'Move to above split' })
  vim.keymap.set('n', '<C-l>', smart_splits.move_cursor_right(), { desc = 'Move to right split' })

  -- Resize with arrows
  vim.keymap.set('n', '<C-Up>', smart_splits.resize_up(), { desc = 'Resize split up' })
  vim.keymap.set('n', '<C-Down>', smart_splits.resize_down(), { desc = 'Resize split down' })
  vim.keymap.set('n', '<C-Left>', smart_splits.resize_left(), { desc = 'Resize split left' })
  vim.keymap.set('n', '<C-Right>', smart_splits.resize_right(), { desc = 'Resize split right' })
else
  vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Move to left split' })
  vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Move to below split' })
  vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Move to above split' })
  vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Move to right split' })
  vim.keymap.set('n', '<C-Up>', '<cmd>resize -2<CR>', { desc = 'Resize split up' })
  vim.keymap.set('n', '<C-Down>', '<cmd>resize +2<CR>', { desc = 'Resize split down' })
  vim.keymap.set('n', '<C-Left>', '<cmd>vertical resize -2<CR>', { desc = 'Resize split left' })
  vim.keymap.set('n', '<C-Right>', '<cmd>vertical resize +2<CR>', { desc = 'Resize split right' })
end
