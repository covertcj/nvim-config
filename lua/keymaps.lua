function cjc_inoremap(keys, action)
  vim.api.nvim_set_keymap('i', keys, action, { noremap = true })
end

function cjc_nnoremap(keys, action)
  vim.api.nvim_set_keymap('n', keys, action, { noremap = true })
end

function cjc_setup_keymaps()
  local nnoremap = cjc_nnoremap
  local inoremap = cjc_inoremap

  nnoremap('<leader>ff', [[<cmd>Telescope find_files<cr>]])
  nnoremap('<leader>fg', [[<cmd>Telescope live_grep<cr>]])
  nnoremap('<leader>bb', [[<cmd>Telescope buffers<cr>]])
  nnoremap('<leader>h' , [[<cmd>Telescope help_tags<cr>]])
end

cjc_setup_keymaps()

