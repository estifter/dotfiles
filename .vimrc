filetype plugin indent on

:syntax on
:set autoindent
:set smartindent
:set expandtab
:set number
:set showmatch

:set background=dark
colorscheme solarized8_flat

" Need to turn off spaces in Makefiles
autocmd FileType make set noexpandtab shiftwidth=4 softtabstop=0

autocmd FileType c set noexpandtab shiftwidth=4 softtabstop=0 tabstop=4
autocmd FileType ocaml set noexpandtab shiftwidth=4 softtabstop=0 tabstop=4
