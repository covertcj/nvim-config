local M = {}

M.toggle_theme = function ()
  local lualine = require'plugins.lualine'
  local blankline = require'plugins.indent-blankline'

  if vim.o.background == 'dark' then
    vim.o.background = 'light'
    vim.cmd[[silent! colorscheme one]]
    lualine.with_theme('onelight')
    blankline.with_color(blankline.light_color)
  else
    vim.o.background = 'dark'
    vim.cmd[[silent! colorscheme moonfly]]
    lualine.with_theme('onedark')
    blankline.with_color(blankline.dark_color)
  end
end

vim.cmd("command! ToggleTheme lua require'theme'.toggle_theme()")

return M

