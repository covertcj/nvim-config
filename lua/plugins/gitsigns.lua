local function config()
  require'gitsigns'.setup()
end

return {
  'lewis6991/gitsigns.nvim',
  requires = 'nvim-lua/plenary.nvim',
  config = config
}
