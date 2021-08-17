local M = {}

M.config = function()
  require'gitsigns'.setup{
    keymaps = {},

    current_line_blame = true,
    current_line_blame_delay = 1000,
    current_line_blame_position = 'eol',
  }
end

M.plugin = {
  'lewis6991/gitsigns.nvim',
  requires = 'nvim-lua/plenary.nvim',
  config = [[require'plugins.gitsigns'.config()]],
}

return M

