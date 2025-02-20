require("config.lazy")

vim.cmd([[
	set number relativenumber
	set cursorline colorcolumn=120 nowrap
	set conceallevel=2
	set list listchars=tab:»\ ,trail:·
	set completeopt=menuone,noinsert
	set grepprg=rg\ --vimgrep\ --ignore-case\ -e grepformat=%f:%l:%c:%m
	set ignorecase smartcase wildignorecase noexpandtab
	set tabstop=4 shiftwidth=0
	set nowritebackup
	set mouse=
	nnoremap <c-l> <cmd>nohlsearch<cr><cmd>redraw<cr>:<cr>
]])

vim.g.airline_powerline_fonts = 1
vim.g.airline_left_sep = ''
vim.g.airline_left_alt_sep = ''
vim.g.airline_right_sep = ''
vim.g.airline_right_alt_sep = ''
vim.g.airline_symbols.branch = ''
vim.g.airline_symbols.colnr = ' ℅:'
vim.g.airline_symbols.readonly = ''
vim.g.airline_symbols.linenr = ' :'
vim.g.airline_symbols.maxlinenr = '☰ '
vim.g.airline_symbols.dirty='⚡'

vim.api.nvim_create_autocmd("ColorScheme", { pattern = "*", command = "highlight Normal   ctermbg=none guibg=none" } )
vim.api.nvim_create_autocmd("ColorScheme", { pattern = "*", command = "highlight NormalNC ctermbg=none guibg=none" } )
vim.cmd("colorscheme everforest")

local git = require("custom.git-telescope")
vim.keymap.set("n", "<leader>gb", git.checkout_branch)
vim.keymap.set("n", "<leader>gm", git.merge_branch)
