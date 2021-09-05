local M = {}

M.config = function()
  vim.g.zettel_link_format="[[%link|%title]]"
  --vim.g.zettel_fzf_command =
  --  "rg --column --line-number --ignore-case --no-heading --color=always "
end

M.plugin = {
  'michal-h21/vim-zettel',
  config = [[require'plugins.vim-zettel'.config()]],
  requires = {
    {'vimwiki/vimwiki'},
    {'junegunn/fzf'},
    {'junegunn/fzf.vim'},
  }
}

return M

