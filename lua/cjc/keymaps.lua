local opts = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap

-- leader
map("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- window resizing
map("n", "<C-Left>" , ":vertical resize -2<CR>", opts)
map("n", "<C-Right>", ":vertical resize +2<CR>", opts)
map("n", "<C-Up>"   , ":resize -2<CR>", opts)
map("n", "<C-Down>" , ":resize +2<CR>", opts)

-- buffer / tab navigation
map("n", "<S-l>", ":bnext<CR>", opts)
map("n", "<S-h>", ":bprevious<CR>", opts)

-- leaving insert mode
map("i", "jk", "<ESC>", opts)
map("i", "kj", "<ESC>", opts)
map('t', 'jk', '<C-\\><C-N>', opts)
map('t', 'kj', '<C-\\><C-N>', opts)

-- keep visual selection when indenting
map("v", ">", ">gv", opts)
map("v", "<", "<gv", opts)

-- move text in visual mode
map("v", "<A-j>", ":m .+1<CR>==", opts)
map("v", "<A-k>", ":m .-2<CR>==", opts)
map("n", "<A-j>", ":m .+1<CR>==", opts)
map("n", "<A-k>", ":m .-2<CR>==", opts)
map("i", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
map("i", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)
map("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
map("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- search
map('n', '<C-_>', '<CMD>noh<CR>', opts) -- <C-/>

