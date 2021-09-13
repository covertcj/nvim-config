local M = {}

M.config = function ()
  require'neoscroll'.setup()
end

M.plugin = {
  'karb94/neoscroll.nvim',
  config = [[require'plugins.neoscroll'.config()]],
}

return M

