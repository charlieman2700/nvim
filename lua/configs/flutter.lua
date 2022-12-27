--
-- -- alternatively you can override the default configs
-- require("flutter-tools").setup {
--   lsp = {
--     color = { -- show the derived colours for dart variables
--       enabled = false, -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
--       background = false, -- highlight the background
--       foreground = false, -- highlight the foreground
--       virtual_text = true, -- show the highlight using virtual text
--       virtual_text_str = "■", -- the virtual text character to highlight
--     },
--     on_attach = require("utils").lsp_onAttach,
--     capabilities = require("utils").capabilities,
--     -- https://github.com/dart-lang/sdk/blob/master/pkg/analysis_server/tool/lsp_spec/README.md#client-workspace-configuration
--     settings = {
--       showTodos = true,
--       completeFunctionCalls = true,
--       -- analysisExcludedFolders = {"<path-to-flutter-sdk-packages>"},
--       renameFilesWithClasses = "prompt", -- "always"
--       enableSnippets = true,
--     }
--   }
-- }
--
local nvim_lsp = require 'lspconfig'
local dart_capabilities = vim.lsp.protocol.make_client_capabilities()
local dart_attach = require('utils').lsp_onAttach

dart_capabilities.textDocument.codeAction = {
  dynamicRegistration = false,
  codeActionLiteralSupport = {
    codeActionKind = {
      valueSet = {
        '',
        'quickfix',
        'refactor',
        'refactor.extract',
        'refactor.inline',
        'refactor.rewrite',
        'source',
        'source.organizeImports',
      },
    },
  },
}
nvim_lsp.dartls.setup {
  on_attach = dart_attach,
  init_options = {
    onlyAnalyzeProjectsWithOpenFiles = true,
    suggestFromUnimportedLibraries = false,
    closingLabels = true,
  },
  capabilities = dart_capabilities,
}
vim.keymap.set('n', '<leader>Fg', ':FlutterRun <cr>', { desc = 'Run' })
vim.keymap.set('n', '<leader>Fd', ':FlutterDevices <cr>', { desc = 'Devices' })
vim.keymap.set('n', '<leader>Fq', ':FlutterQuit <cr>', { desc = 'Quit' })
vim.keymap.set('n', '<leader>Fo', ':FlutterOutlineToggle <cr>', { desc = 'Outline' })
vim.keymap.set('n', '<leader>FR', ':FlutterRestart <cr>', { desc = 'Go to next buffer' })
