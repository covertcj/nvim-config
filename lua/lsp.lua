local M = {}

vim.cmd("command! Format lua require'lsp.format'.format()")

local function on_attach(client)
  require'keymaps'.apply_lsp_keymapping(client)

  -- TODO revisit these shortcuts and formatting
  -- much borrowed from https://github.com/lukas-reineke/dotfiles/tree/796a9252c84cdd89fc5f40c6bd5e12159658b167/vim

  local capabilities = client.resolved_capabilities

  if capabilities.document_highlight then
    vim.api.nvim_command [[autocmd CursorHold  <buffer> lua vim.lsp.buf.document_highlight()]]
    vim.api.nvim_command [[autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()]]
    vim.api.nvim_command [[autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()]]
  end

  require "lsp_signature".on_attach({
    hint_enable = false,
    hi_parameter = "QuickFixLine",
    handler_opts = {
      border = vim.g.floating_window_border
    }
  })
end

function M.setup_lsp()
  local lsp = require'lspconfig'
  local util = require 'lspconfig'.util
  require('packer').loader('coq_nvim coq.artifacts')
  local coq = require'coq'()

  lsp.tsserver.setup(coq.lsp_ensure_capabilities{
    init_options = {documentFormatting = false},
    on_attach = function (client)
      client.resolved_capabilities.document_formatting = false
      -- require "nvim-lsp-ts-utils".setup {}
      on_attach(client)
    end
  })

  local prettier = require 'lsp.efm.prettier'
  local eslint = require 'lsp.efm.eslint'

  lsp.efm.setup(coq.lsp_ensure_capabilities{
    on_attach = on_attach,
    init_options = {documentFormatting = true},
    root_dir = vim.loop.cwd,
    filetypes = {
      'javascript', 'typescript', 'javascriptreact', 'typescriptreact',
      'yaml',
      'json',
      'html',
      'scss',
      'css',
      'markdown'
    },
    settings = {
      rootMarkers = {".git/"},
      languages = {
        typescript = {prettier, eslint},
        javascript = {prettier, eslint},
        typescriptreact = {prettier, eslint},
        javascriptreact = {prettier, eslint},
        yaml = {prettier},
        json = {prettier},
        html = {prettier},
        scss = {prettier},
        css = {prettier},
        markdown = {prettier},
      }
    }
  })
end

return M
