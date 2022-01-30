local lsp_installer = require'nvim-lsp-installer'

lsp_installer.on_server_ready(function (server)
  local handlers = require'cjc.lsp.handlers'
  local opts = {
    on_attach = handlers.on_attach,
    capabilities = handlers.capabilities,
  }

  local settings_exist, server_settings = pcall(require, string.format('cjc.lsp.servers.%s', server.name))
  if settings_exist and server_settings.get_opts ~= nil then
    local server_opts = server_settings.get_opts()
    opts = vim.tbl_deep_extend('force', server_opts, opts)
  end

  server:setup(opts)
end)
