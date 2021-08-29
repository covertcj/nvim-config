local M = {}

M.config = function()
  require'gitsigns'.setup{
    keymaps = {},

    current_line_blame = true,
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = 'right_align', -- 'eol' | 'overlay' | 'right_align'
      delay = 1000,
    },
  }
end

M.plugin = {
  'lewis6991/gitsigns.nvim',
  requires = 'nvim-lua/plenary.nvim',
  config = [[require'plugins.gitsigns'.config()]],
}

return M

