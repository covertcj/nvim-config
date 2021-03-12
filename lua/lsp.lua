local lsp_config = require'lspconfig'

lsp_config.tsserver.setup{}

local eslint = {
  lintCommand = "./node_modules/.bin/eslint -f unix --stdin",
  lintStdin = true,
  lintIgnoreExitCode = true,
--  lintFormats = {"%f:%l:%c: %m"},
--  formatCommand = "eslint --fix-to-stdout --stdin --stdin-filename=${INPUT}",
--  formatStdin = true
}

local efm_languages = {
  javascript = {eslint},
  typescript = {eslint},
  javascriptreact = {eslint},
  typescriptreact = {eslint},
}

lsp_config.efm.setup {
  root_dir = lsp_config.util.root_pattern('.git'),

  init_options = {
    documentFormatting = true,
    codeAction = true,
  },

  filetypes = vim.tbl_keys(efm_languages),
  settings = {
    languages = efm_languages,
    log_level = 1,
    log_file = '~/.config/nvim/efm.log'
  }
}
