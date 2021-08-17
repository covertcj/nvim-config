local function config()
  require'gitsigns'.setup{
    keymaps = {},

    current_line_blame = true,
    current_line_blame_delay = 1000,
    current_line_blame_position = 'eol',
  }
end

return {
  'lewis6991/gitsigns.nvim',
  requires = 'nvim-lua/plenary.nvim',
  config = config
}
