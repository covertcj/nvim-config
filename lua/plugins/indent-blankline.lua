local M = {}

M.dark_color = '#141414'
M.light_color = '#f4f4f4'

M.with_color = function(color)
  vim.cmd [[highlight IndentOdd guifg=NONE guibg=NONE gui=nocombine]]
  vim.cmd([[highlight IndentEven guifg=NONE guibg=]] .. color .. [[ gui=nocombine]])

  vim.g.indent_blankline_char_highlight_list = {'IndentOdd', 'IndentEven'}
  vim.g.indent_blankline_space_char_highlight_list = {'IndentOdd', 'IndentEven'}

  vim.g.indent_blankline_char = ' '
  vim.g.indent_blankline_space_char = ' '

  vim.g.indent_blankline_show_trailing_blankline_indent = false

  require'indent_blankline'.setup{}
end

M.config = function()
  M.with_color(M.dark_color)
end

M.plugin = {
  'lukas-reineke/indent-blankline.nvim',
  config = [[require'plugins.indent-blankline'.config()]],
}

return M

