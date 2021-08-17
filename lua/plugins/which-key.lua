local function config()
  local wk = require'which-key'
  wk.setup{}

  local km = require'keymaps'.setup_keys(wk)
end

return {
  'folke/which-key.nvim',
  config = config
}
