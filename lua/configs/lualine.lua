require('lualine').setup {
  options = {
    icons_enabled = false,
    -- theme = 'onedark',
    component_separators = '|',
    section_separators = '',
  },
}
require('lualine').hide()

vim.api.nvim_create_autocmd('BufAdd', {
  callback = function()
    require('lualine').hide { unhide = true }
  end,
})
