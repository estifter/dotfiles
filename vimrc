call plug#begin('~/.vim/plugged')

Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'ellisonleao/gruvbox.nvim'

call plug#end()

set noswapfile
set number

set background=dark
colorscheme gruvbox

" Need to turn off spaces in Makefiles
autocmd FileType make set noexpandtab shiftwidth=4 softtabstop=0 tabstop=4
autocmd FileType c set noexpandtab shiftwidth=4 softtabstop=0 tabstop=4
autocmd FileType ocaml set noexpandtab shiftwidth=4 softtabstop=0 tabstop=4

filetype plugin indent on

lua << EOF
require('lualine').setup {
	options = {
		theme = 'gruvbox'
	}
}

require('nvim-treesitter.configs').setup {
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false
	},
	indent = {
		enable = true
	},
}
EOF
