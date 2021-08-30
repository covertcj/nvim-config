local M = {}

M.config = function ()
  -- automatically initalize COQ after 2.5 seconds
  -- sort of a workaround for an issue where COQnow seems to be undefined
  -- *sometimes* when executed immediately
  -- vim.defer_fn(function()
  --   vim.cmd [[COQnow --shut-up]]
  -- end, 2000)
end

M.plugin = {
  'ms-jpq/coq_nvim',
  config = [[require'plugins.coq'.config()]],
}

return M
