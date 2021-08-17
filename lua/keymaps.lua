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

return M

