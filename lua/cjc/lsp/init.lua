local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require'cjc/lsp/lsp-installer'
require'cjc/lsp/handlers'.setup()
