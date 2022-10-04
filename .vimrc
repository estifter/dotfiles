filetype on
filetype plugin on
filetype indent on

:syntax on
:set softtabstop=4
:set shiftwidth=4
:set autoindent
:set smartindent
:set expandtab
:set number
:set showmatch

:set background=dark
colorscheme solarized8_flat

" Need to turn off spaces in Makefiles
autocmd FileType make set noexpandtab shiftwidth=4 softtabstop=0
