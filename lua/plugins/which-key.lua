local M = {}

M.config = function()
  local wk = require'which-key'
  wk.setup{}

  local km = require'keymaps'.setup_keys(wk)
end

M.plugin = {
  'folke/which-key.nvim',
  config = [[require'plugins.which-key'.config()]],
}

return M

