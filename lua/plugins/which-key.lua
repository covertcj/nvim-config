local function config()
  local wk = require'which-key'
  wk.setup{}

  local km = require'keymaps'

  wk.register(km.leader_keys, { prefix = '<leader>' })
end

return {
  'folke/which-key.nvim',
  config = config
}
