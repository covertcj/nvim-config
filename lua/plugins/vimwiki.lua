local function setup()
  vim.g.vimwiki_folding = 'expr'
  vim.g.vimwiki_list = {{
    path = '~/notes/',
    syntax = 'markdown',
    ext = '.md',
  }}
end

return {
  'vimwiki/vimwiki',
  setup = setup
}

