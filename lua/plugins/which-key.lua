local M = {}

local function config()
  local wk = require'which-key'
  wk.setup{}

  local km = require'keymaps'.setup_keys(wk)
end

M.plugin = {
  'folke/which-key.nvim',
  config = config
}

return M

