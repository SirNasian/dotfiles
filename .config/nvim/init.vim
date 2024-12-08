set number relativenumber
set cursorline colorcolumn=120 nowrap
set list listchars=tab:»\ ,trail:·
set completeopt=menuone,noinsert
set grepprg=rg\ --vimgrep\ --ignore-case\ -e grepformat=%f:%l:%c:%m
set ignorecase smartcase wildignorecase noexpandtab
set tabstop=4 shiftwidth=0
set nowritebackup
set mouse=

inoremap <c-j> <down>
inoremap <c-k> <up>

call plug#begin()
	Plug 'hrsh7th/cmp-buffer'
	Plug 'hrsh7th/cmp-nvim-lsp'
	Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
	Plug 'hrsh7th/nvim-cmp'
	Plug 'junegunn/fzf'
	Plug 'junegunn/fzf.vim'
	Plug 'mattia72/vim-delphi'
	Plug 'neovim/nvim-lspconfig'
	Plug 'sainnhe/everforest'
	Plug 'stevearc/oil.nvim'
	Plug 'tpope/vim-fugitive'
	Plug 'tpope/vim-repeat'
	Plug 'tpope/vim-surround'
	Plug 'vim-airline/vim-airline'
call plug#end()

let g:airline_powerline_fonts = 1

autocmd ColorScheme * highlight Normal   ctermbg=none guibg=none
autocmd ColorScheme * highlight NormalNC ctermbg=none guibg=none
colorscheme everforest

lua <<EOF
require("oil").setup()
require("lsp-keybinds").setup()

local lspconfig = require("lspconfig")
local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
lspconfig.clangd.setup({ capabilities = lsp_capabilities })
lspconfig.gdscript.setup({ capabilities = lsp_capabilities })
lspconfig.jsonls.setup({ capabilities = lsp_capabilities })
lspconfig.lua_ls.setup({ capabilities = lsp_capabilities })

local nvim_cmp = require("cmp")
nvim_cmp.setup({
	sources = {
		{ name = "nvim_lsp_signature_help" },
		{ name = "nvim_lsp" },
		{ name = "buffer" },
	},
	mapping = nvim_cmp.mapping.preset.insert({
		["<c-j>"] = nvim_cmp.mapping.select_next_item(),
		["<c-k>"] = nvim_cmp.mapping.select_prev_item(),
		["<c-y>"] = nvim_cmp.mapping.confirm({ select = true }),
	})
})
EOF
