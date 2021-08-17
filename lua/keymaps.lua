local M = {}

M.nnoremap = function(lhs, rhs)
  vim.api.nvim_set_keymap('n', lhs, rhs, { noremap = true })
end

M.leader_keys = {
  f = {
    name = 'files',
    f = { [[<cmd>Telescope find_files<CR>]], 'find file' },
    g = { [[<cmd>Telescope live_grep<CR>]], 'grep files' },
    s = { [[<cmd>write<CR>]], 'save' },
  },

  b = {
    name = 'buffers',
    b = { [[<cmd>Telescope buffers<CR>]], 'find buffer' },
  },

  h = {
    name = 'help',
    h = { [[<cmd>Telescope help_tags<CR>]], 'help tags' },
  },

  g = {
    name = 'git',
    g = { [[<cmd>Git<CR>]], 'status' },
  },
}

M.nnoremap('<C-l>', [[<cmd>noh<CR>]])

M.generate_lsp_map = function (lsp_client)
  local capabilities = lsp_client.resolved_capabilities
  local mode = {
    name = 'mode'
  }

  print(table.concat(capabilities, ', '))

  if capabilities.document_formatting then
    mode.f = {[[<CMD>Format<CR>]], 'format', buffer=0}
  end

  if capabilities.goto_definition then
    mode.g = {[[<CMD>Telescope lsp_definitions<CR>]], 'definitions', buffer=0}
  end

  if capabilities.hover then
    mode.c = {[[<CMD>lua vim.lsp.buf.hover()<CR>]], 'under cursor', buffer=0}
  end

  if capabilities.signature_help then
    mode.s = {[[<CMD>lua vim.lsp.buf.signature_help()<CR>]], 'signature help', buffer=0}
  end

  return mode
end

return M

