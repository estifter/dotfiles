call plug#begin('~/.vim/plugged')

Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'ellisonleao/gruvbox.nvim'
Plug 'sbdchd/neoformat'

call plug#end()

set noswapfile
set number

set background=dark
colorscheme gruvbox

" Need to turn off spaces in Makefiles
autocmd FileType make set noexpandtab shiftwidth=4 softtabstop=0 tabstop=4
autocmd FileType c set noexpandtab shiftwidth=4 softtabstop=0 tabstop=4
autocmd FileType ocaml set expandtab shiftwidth=2 softtabstop=2 tabstop=4
autocmd FileType markdown set smarttab shiftwidth=4 softtabstop=0 tabstop=4
autocmd FileType markdown setlocal spell spelllang=en_us
autocmd FileType html set noexpandtab shiftwidth=2 softtabstop=0 tabstop=2
autocmd FileType javascript set expandtab shiftwidth=2 softtabstop=2 tabstop=4

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
}
EOF

augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END
