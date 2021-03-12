nnoremap <silent> gd        <CMD>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD        <CMD>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> gt        <CMD>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> <C-k>     <CMD>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> K         <CMD>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <leader>. <CMD>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> ]g        <CMD>lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <silent> [g        <CMD>lua vim.lsp.diagnostic.goto_prev()<CR>

nnoremap <leader>fr   <CMD>lua require('telescope.builtin').lsp_references{}<CR>
nnoremap <leader>fs   <CMD>lua require('telescope.builtin').lsp_document_symbols{}<CR>
nnoremap <leader>fws  <CMD>lua require('telescope.builtin').lsp_workspace_symbols{}<CR>
nnoremap <leader>f.   <CMD>lua require('telescope.builtin').lsp_code_actions{}<CR>
nnoremap <leader>fr.  <CMD>lua require('telescope.builtin').lsp_range_code_actions{}<CR>
nnoremap <leader>fd   <CMD>lua require('telescope.builtin').lsp_definitions{}<CR>

lua require'lsp'

