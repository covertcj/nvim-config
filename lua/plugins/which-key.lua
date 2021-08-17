local M = {}

M.config = function ()
  local wk = require'which-key'
  wk.setup{}

  local km = require'keymaps'

  wk.register(km.leader_keys, { prefix = '<leader>' })
end

return M
