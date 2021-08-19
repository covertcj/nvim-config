local M = {}

M.setup = function ()
  vim.g.floaterm_width = 0.85
  vim.g.floaterm_height = 0.85

  vim.g.floaterm_position = 'top'
end

M.plugin = {
  'voldikss/vim-floaterm',
  setup = [[require'plugins.floaterm'.setup()]],
}

return M

