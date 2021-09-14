local M = {}

M.setup = function ()
  vim.g.better_escape_shortcut = {'jk', 'kj'}
end

M.plugin = {
  'jdhao/better-escape.vim',
  event = 'InsertEnter',
  setup = [[require'plugins.better-escape'.setup()]],
}

return M

