call plug#begin(stdpath('data') . '/plugged')

Plug 'neovim/nvim-lspconfig'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'morhetz/gruvbox'

Plug 'tpope/vim-fugitive'

Plug 'voldikss/vim-floaterm'

Plug 'kamykn/popup-menu.nvim'
Plug 'kamykn/spelunker.vim'

Plug 'nvim-lua/completion-nvim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " update parsers on update

Plug 'editorconfig/editorconfig-vim'

call plug#end()

