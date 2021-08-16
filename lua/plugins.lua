local on_attach = function(client)
  local map = vim.api.nvim_buf_set_keymap

  -- TODO revisit these shortcuts and formatting
  -- much borrowed from https://github.com/lukas-reineke/dotfiles/tree/796a9252c84cdd89fc5f40c6bd5e12159658b167/vim

  if client.resolved_capabilities.document_formatting then
    vim.cmd("command! -buffer Format lua require'lsp.format'.format()")
    map(0, "n", "<leader>rf", ":Format<CR>", {noremap = true})
  --   vim.cmd [[augroup Format]]
  --   vim.cmd [[autocmd! * <buffer>]]
  --   vim.cmd [[autocmd BufWritePost <buffer> lua require'lsp.formatting'.format()]]
  --   vim.cmd [[augroup END]]
  end

  if client.resolved_capabilities.goto_definition then
    map(0, "n", "<C-]>", "<cmd>lua vim.lsp.buf.definition()<CR>", {noremap = true})
  end

  if client.resolved_capabilities.hover then
    map(0, "n", "<CR>", "<cmd>lua vim.lsp.buf.hover()<CR>", {noremap = true})
  end

  -- if client.resolved_capabilities.find_references then
  --   map(
  --     0,
  --     "n",
  --     "<Space>*",
  --     ":lua require('lists').change_active('Quickfix')<CR>:lua vim.lsp.buf.references()<CR>",
  --     {noremap = true}
  --   )
  -- end

  -- if client.resolved_capabilities.rename then
  --   map(0, "n", "<Space>rn", "<cmd>lua require'lsp.rename'.rename()<CR>", {silent = true, noremap = true})
  -- end

  if client.resolved_capabilities.signature_help then
    map(0, "n", "<Space>s", "<cmd>lua vim.lsp.buf.signature_help()<CR>", {silent = true, noremap = true})
  end

  require "lsp_signature".on_attach({
    hint_enable = false,
    hi_parameter = "QuickFixLine",
    handler_opts = {
      border = vim.g.floating_window_border
    }
  })
end

function setup_lsp()
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

return require('packer').startup(function ()
  use 'wbthomason/packer.nvim'

  use {
    'bluz71/vim-moonfly-colors',
    config = [[vim.cmd "colorscheme moonfly"]]
  }

  use 'b3nj5m1n/kommentary'

  use 'ms-jpq/coq.artifacts'
  use 'ms-jpq/coq_nvim'

  use 'ray-x/lsp_signature.nvim'
  use {
    'neovim/nvim-lspconfig',
    opt = false,
    --requires = {'ms-jpq/coq_nvim'}, TODO: see above
    config = function ()
      vim.schedule(setup_lsp)
    end
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
end)

