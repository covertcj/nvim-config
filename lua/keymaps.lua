local M = {}

M.nnoremap = function(lhs, rhs)
  vim.api.nvim_set_keymap('n', lhs, rhs, { noremap = true })
end

M.tnoremap = function(lhs, rhs)
  vim.api.nvim_set_keymap('t', lhs, rhs, { noremap = true })
end

M.leader_keys = {
  ['<space>'] = { [[<CMD>Telescope find_files<CR>]], 'find file' },

  f = {
    name = 'files',
    f = { [[<CMD>Telescope find_files<CR>]], 'find file' },
    g = { [[<CMD>Telescope live_grep<CR>]], 'grep files' },
    s = { [[<CMD>write<CR>]], 'save' },
  },

  b = {
    name = 'buffers',
    b = { [[<CMD>Telescope buffers<CR>]], 'find buffer' },
  },

  h = {
    name = 'help',
    h = { [[<CMD>Telescope help_tags<CR>]], 'help tags' },
  },

  g = {
    name = 'git',
    g = { [[<CMD>Git<CR>]], 'status' },
  },

  t = {
    name = 'settings',
    t = { [[<CMD>ToggleTheme<CR>]], 'theme' },
  },

  o = {
    name = 'open',
    f = { [[<CMD>CHADopen<CR>]], 'file tree' },
  },
}

M.apply_lsp_keymapping = function (lsp_client)
  local wk = require'which-key'
  local capabilities = lsp_client.resolved_capabilities
  local mode = { name = 'mode' }
  local modeV = { name = 'mode' }

  print(vim.inspect(capabilities, ', '))

  if capabilities.document_formatting then
    mode.f = {[[<CMD>Format<CR>]], 'format', buffer=0}
  end

  if capabilities.code_action then
    mode.a = {[[<CMD>:Lspsaga code_action<CR>]], 'code actions', buffer=0}
    modeV.a = {[[<CMD>:Lspsaga code_action<CR>]], 'code actions', buffer=0}
  end

  if capabilities.rename then
    mode.r = {[[<CMD>Lspsaga rename<CR>]], 'rename', buffer=0}
  end

  mode.d = {[[<CMD>Lspsaga show_line_diagnostics<CR>]], 'diagnostic', buffer=0}
  mode.D = {[[<CMD>Telescope lsp_document_diagnostics<CR>]], 'file diagnostics', buffer=0}
  mode.w = {[[<CMD>Telescope lsp_workspace_diagnostics<CR>]], 'workspace diagnostics', buffer=0}

  wk.register({
    ['[e'] = {[[<CMD>Lspsaga diagnostic_jump_prev<CR>]], 'prev diagnostic', buffer=0},
    [']e'] = {[[<CMD>Lspsaga diagnostic_jump_next<CR>]], 'next diagnostic', buffer=0},
  })

  if capabilities.document_symbol then
    mode.s = {[[<CMD>Telescope lsp_document_symbols<CR>]], 'symbols', buffer=0}
  end

  if capabilities.workspace_symbol then
    mode.S = {[[<CMD>Telescope lsp_workspace_symbols<CR>]], 'workspace symbols', buffer=0}
  end

  if capabilities.goto_definition then
    wk.register({
      ['gd'] = { [[<CMD>Telescope lsp_implementations<CR>]], 'goto definition' },
    })

    mode.p = { [[<CMD>Lspsaga preview_definition<CR>]], 'preview definition' },
  end

  if capabilities.implementation then
    wk.register({
      ['gi'] = { [[<CMD>Telescope lsp_implementations<CR>]], 'goto implementation' }
    })

    mode.R = {[[<CMD>Telescope lsp_references<CR>]], 'references', buffer=0}
  end

  if capabilities.hover then
    mode.c = {[[<CMD>lua vim.lsp.buf.hover()<CR>]], 'under cursor', buffer=0}
  end

  if capabilities.signature_help then
    mode.f = {[[<CMD>lua vim.lsp.buf.signature_help()<CR>]], 'signature', buffer=0}
  end

  wk.register(
    { m = mode },
    { prefix = '<leader>', mode = 'n' }
  )

  wk.register(
    { m = mode },
    { prefix = '<leader>', mode = 'v' }
  )
end

M.nnoremap('<C-l>', [[<CMD>noh<CR>]])

M.tnoremap('<Esc>', [[<C-\><C-N>]])
M.tnoremap('<C-]>', [[<Esc>]])
vim.g.floaterm_keymap_toggle = '<F4>'
vim.g.floaterm_keymap_new = '<F5>'
vim.g.floaterm_keymap_next = '<F3>'
vim.g.floaterm_keymap_prev = '<F2>'

return M

