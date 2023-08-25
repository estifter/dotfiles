call plug#begin('~/.vim/plugged')

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

Plug 'folke/trouble.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-tree/nvim-web-devicons'
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
autocmd FileType vim set noexpandtab shiftwidth=2 softtabstop=0 tabstop=2
autocmd FileType c set noexpandtab shiftwidth=4 softtabstop=0 tabstop=4
autocmd FileType ocaml set expandtab shiftwidth=2 softtabstop=2 tabstop=4
autocmd FileType markdown set smarttab shiftwidth=4 softtabstop=0 tabstop=4
autocmd FileType markdown setlocal spell spelllang=en_us
autocmd FileType html set noexpandtab shiftwidth=2 softtabstop=0 tabstop=2
autocmd FileType javascript set expandtab shiftwidth=2 softtabstop=2 tabstop=4

filetype plugin indent on

let mapleader = ","
nnoremap <Leader>xx <cmd>TroubleToggle<cr>
vnoremap <Leader>d $

lua << EOF
require('trouble').setup {}

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
-- Set up nvim-cmp.
local cmp = require'cmp'

cmp.setup({
	snippet = {
		expand = function(args)
		vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
	end,
	},
	window = {
	-- completion = cmp.config.window.bordered(),
	-- documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
	['<C-b>'] = cmp.mapping.scroll_docs(-4),
	['<C-f>'] = cmp.mapping.scroll_docs(4),
	['<C-Space>'] = cmp.mapping.complete(),
	['<C-e>'] = cmp.mapping.abort(),
	['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'vsnip' }, -- For vsnip users.
	}, {
		{ name = 'buffer' },
	})
	})

	-- Set configuration for specific filetype.
	cmp.setup.filetype('gitcommit', {
	sources = cmp.config.sources({
		{ name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
		}, {
		{ name = 'buffer' },
		})
	})

	-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
	cmp.setup.cmdline({ '/', '?' }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'buffer' }
		}
	})

	-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
	cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path' }
		}, {
		{ name = 'cmdline' }
	})
})

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
require('lspconfig')['ocamllsp'].setup {
	capabilities = capabilities
}
EOF

augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END
