vim.keymap.set('n', 'lk', vim.diagnostic.goto_prev)
vim.keymap.set('n', 'lj', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>lh', vim.diagnostic.open_float)

local on_attach = require('utils').lsp_onAttach
-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = require('utils').capabilities
--
-- require("lvim.lsp.manager").setup("sourcery", {
-- 	init_options = {
-- 		--- The Sourcery token for authenticating the user.
-- 		--- This is retrieved from the Sourcery website and must be
-- 		--- provided by each user. The extension must provide a
-- 		--- configuration option for the user to provide this value.
-- 		token = "user_VCDcHGTmv78ccEkuHNiDhecY1zuXdQ0uYOTp_ylVyg7TlDSmJ5mrGV3ze8I",
--
-- 		--- The extension's name and version as defined by the extension.
-- 		extension_version = "vim.lsp",
--
-- 		--- The editor's name and version as defined by the editor.
-- 		editor_version = "vim",
-- 	},
local words = { 'Laboratorio' }

local nvimPath = vim.call('stdpath', 'config')
local dictionaries = {
  path = nvimPath .. '/lua/dictionaries/es.utf-8.add',
  dictionaryEnglish = nvimPath .. '/lua/dictionaries/english.txt',
}
for _, value in pairs(dictionaries) do
  for word in io.open(value, 'r'):lines() do
    table.insert(words, word)
  end
end

local servers = {
  ltex = {
    ltex = {
      dictionary = {
        ['es'] = words,
      },
      disabledRules = { ['es'] = { 'SMART_QUOTES' } },
      -- commands =  vim.json.decode("{ '\\label{}': 'ignore', '\\documentclass[]{}': 'ignore', '\\cite{}': 'dummy', '\\cite[]{}': 'dummy'}"),
      additionalRules = {
        enablePickyRules = true,
        motherTongue = 'es',
      },
      language = 'es',
    },
  },
  -- gopls = {},
  -- pyright = {},
  -- rust_analyzer = {},
  -- tsserver = {},

  sumneko_lua = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
}

-- Setup neovim lua configuration
require('neodev').setup()
--

-- Setup mason so it can manage external tooling
require('mason').setup()

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
    }
  end,
}

-- Turn on lsp status information
require('fidget').setup()

-- nvim-cmp setup
local cmp = require 'cmp'
local luasnip = require 'luasnip'

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}
