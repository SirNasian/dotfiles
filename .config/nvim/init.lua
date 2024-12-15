vim.cmd([[
	set number relativenumber
	set cursorline colorcolumn=120 nowrap
	set list listchars=tab:»\ ,trail:·
	set completeopt=menuone,noinsert
	set grepprg=rg\ --vimgrep\ --ignore-case\ -e grepformat=%f:%l:%c:%m
	set ignorecase smartcase wildignorecase noexpandtab
	set tabstop=4 shiftwidth=0
	set nowritebackup
	set mouse=

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
]])

vim.g.airline_powerline_fonts = 1

require("oil").setup()

local lspconfig = require("lspconfig")
local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
lspconfig.clangd.setup({ capabilities = lsp_capabilities })
lspconfig.gdscript.setup({ capabilities = lsp_capabilities })
lspconfig.jsonls.setup({ capabilities = lsp_capabilities })
lspconfig.lua_ls.setup({ capabilities = lsp_capabilities })

local cmp = require("cmp")
cmp.setup({
	sources = {
		{ name = "nvim_lsp_signature_help" },
		{ name = "nvim_lsp" },
		{ name = "buffer" },
	},
	mapping = cmp.mapping.preset.insert({
		["<c-j>"] = cmp.mapping.select_next_item(),
		["<c-k>"] = cmp.mapping.select_prev_item(),
		["<c-y>"] = cmp.mapping.confirm({ select = true }),
	})
})


vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP Keybindings",
	callback = function(event)
		local opts = { buffer = event.buf }
		vim.keymap.set("n", "K",  "<cmd>lua vim.lsp.buf.hover()<cr>",           opts)
		vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>",      opts)
		vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>",     opts)
		vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>",  opts)
		vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
		vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>",      opts)
		vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>",  opts)
		vim.keymap.set("n", "gR", "<cmd>lua vim.lsp.buf.rename()<cr>",          opts)
		vim.keymap.set("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<cr>",     opts)
		vim.keymap.set("n", "gq", "<cmd>lua vim.diagnostic.setqflist()<cr>",    opts)
	end,
})

vim.api.nvim_create_autocmd("ColorScheme", { pattern = "*", command = "highlight Normal   ctermbg=none guibg=none" } )
vim.api.nvim_create_autocmd("ColorScheme", { pattern = "*", command = "highlight NormalNC ctermbg=none guibg=none" } )
vim.cmd("colorscheme everforest")
