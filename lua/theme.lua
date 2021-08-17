local M = {}

M.toggle_theme = function ()
  if vim.o.background == 'dark' then
    vim.o.background = 'light'
    vim.cmd[[silent! colorscheme one]]
  else
    vim.o.background = 'dark'
    vim.cmd[[silent! colorscheme moonfly]]
  end
end

vim.cmd("command! ToggleTheme lua require'theme'.toggle_theme()")

return M

