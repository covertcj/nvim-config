local M = {}

M.setup = function()
  vim.g.vimwiki_folding = 'expr'
  vim.g.vimwiki_list = {{
    path = '~/notes/',
    syntax = 'markdown',
    ext = '.md',
  }}
end

M.plugin = {
  'vimwiki/vimwiki',
  setup = [[require'plugins.vimwiki'.setup()]],
}

return M

