local M = {}

local function setup()
  vim.g.vimwiki_folding = 'expr'
  vim.g.vimwiki_list = {{
    path = '~/notes/',
    syntax = 'markdown',
    ext = '.md',
  }}
end

M.plugin = {
  'vimwiki/vimwiki',
  setup = setup
}

return M

