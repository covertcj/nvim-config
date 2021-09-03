local M = {}

M.config = function ()
  vim.g.neoformat_try_node_exe = 1

  -- copied from https://github.com/sbdchd/neoformat/blob/master/autoload/neoformat/formatters/markdown.vim
  vim.g.neoformat_vimwiki_prettier = {
    exe = 'prettier',
    args = { '--stdin-filepath', '"%:p"' },
    stdin = 1,
    try_node_exe = 1,
  }

  vim.g.neoformat_enabled_vimwiki = {'prettier'}

  vim.cmd [[
    augroup AutoFormatOnSave
      autocmd BufWritePre *.js,*.ts,*.jsx,*.tsx :lua require'format'.format('prettier')
      autocmd BufWritePre *.md                  :lua require'format'.format('prettier')
      autocmd BufWritePre *.json,*.yml,*.yaml   :lua require'format'.format('prettier')
      autocmd BufWritePre *.html                :lua require'format'.format('prettier')
      autocmd BufWritePre *.css,*.scss          :lua require'format'.format('prettier')
    augroup END
  ]]
end

M.plugin = {
  'sbdchd/neoformat',
  config = [[require'plugins.neoformat'.config()]],
}

return M
