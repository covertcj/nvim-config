local status_ok, which_key = pcall(require, 'which-key')
if not status_ok then
  return
end

local n_opts = {
  mode = 'n',
  prefix = '<leader>',
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
}

local n_mappings = {
  f = {
    name = 'file',
    f = { '<CMD>Telescope find_files<CR>', 'find file' },
    g = { '<CMD>Telescope live_grep<CR>', 'grep' },
    s = { '<CMD>w<CR>', 'save' },
  },

  o = {
    name = 'open',
    e = { '<CMD>NvimTreeToggle<CR>', 'explorer' },
  },

  l = {
    name = 'lsp',
    a = { '<CMD>lua vim.lsp.buf.code_action()<CR>', 'code action' },
    j = { '<CMD>lua vim.lsp.diagnostic.goto_next()<CR>', 'next diagnostic' },
    k = { '<CMD>lua vim.lsp.diagnostic.goto_prev()<CR>', 'prev diagnostic' },
    r = { '<CMD>lua vim.lsp.buf.rename()<CR>', 'rename' },
    d = { '<CMD>Telescope lsp_document_diagnostics<CR>', 'diagnostics', },
    D = { '<CMD>Telescope lsp_workspace_diagnostics<CR>', 'workspace diagnostics', },
    s = { '<CMD>Telescope lsp_document_symbols<CR>', 'symbols', },
    S = { '<CMD>Telescope lsp_workspace_symbols<CR>', 'workspace symbols', },
    i = { '<CMD>LspInfo<CR>', 'lsp info', },
    I = { '<CMD>LspInstallInfo<CR>', 'lsp install info', },
  },

  g = {
    name = 'git',
    g = { '<CMD>Neogit<CR>', 'neogit'},
    j = { '<CMD>Gitsigns next_hunk<CR>', 'next hunk'},
    k = { '<CMD>Gitsigns prev_hunk<CR>', 'prev hunk'},
    p = { '<CMD>Gitsigns preview_hunk<CR>', 'preview hunk'},
  },

  P = {
    name = 'packer',
    s = { '<CMD>PackerSync<CR>', 'sync' },
    S = { '<CMD>PackerStatus<CR>', 'status' },
    u = { '<CMD>PackerUpdate<CR>', 'update' },
  },
}

which_key.setup()
which_key.register(n_mappings, n_opts)

