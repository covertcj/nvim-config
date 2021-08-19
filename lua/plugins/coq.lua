local M = {}

M.config = function ()
  vim.cmd [[COQnow --shut-up]]
end

M.plugin = {
  'ms-jpq/coq_nvim',
  config = [[require'plugins.coq'.config()]],
}

return M
