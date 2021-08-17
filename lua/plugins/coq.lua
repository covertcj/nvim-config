local M = {}

M.config = function ()
  vim.schedule(function ()
    vim.cmd [[COQnow --shut-up]]
  end)
end

M.plugin = {
  'ms-jpq/coq_nvim',
  config = [[require'plugins.coq'.config()]],
}

return M
