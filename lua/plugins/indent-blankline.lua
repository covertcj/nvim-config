local function config()
  vim.cmd [[highlight IndentOdd guifg=NONE guibg=NONE gui=nocombine]]
  vim.cmd [[highlight IndentEven guifg=NONE guibg=#141414 gui=nocombine]]

  vim.g.indent_blankline_char_highlight_list = {'IndentOdd', 'IndentEven'}
  vim.g.indent_blankline_space_char_highlight_list = {'IndentOdd', 'IndentEven'}

  vim.g.indent_blankline_char = ' '
  vim.g.indent_blankline_space_char = ' '

  vim.g.indent_blankline_show_trailing_blankline_indent = false

  require'indent_blankline'.setup{}
end

return {
  'lukas-reineke/indent-blankline.nvim',
  config = config
}

