local lsp_installer = require'nvim-lsp-installer'

lsp_installer.on_server_ready(function (server)
  local handlers = require'cjc.lsp.handlers'
  local opts = {
    on_attach = handlers.on_attach,
    capabilities = handlers.capabilities,
  }

  -- TODO make loading these files dynamic based on the server's name
  -- the on_attach logic should be moveable as well I think
  if server.name == "sumneko_lua" then
    local sumneko_opts = require'cjc.lsp.settings.sumneko_lua'.get_opts()
    opts = vim.tbl_deep_extend('force', sumneko_opts, opts)
  end

  if server.name == "jsonls" then
    local jsonls_opts = require'cjc.lsp.settings.jsonls'.get_opts()
    opts = vim.tbl_deep_extend('force', jsonls_opts, opts)
  end

  server:setup(opts)
end)
