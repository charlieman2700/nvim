require('react-extract').setup()

vim.keymap.set({ 'v' }, '<Leader>re', require('react-extract').extract_to_new_file, { desc = 'Extract to new file' })

vim.keymap.set({ 'v' }, '<Leader>rc', require('react-extract').extract_to_current_file, { desc = 'Extract to current file' })
