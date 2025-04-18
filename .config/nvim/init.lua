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
]])

local git = require("custom.git-telescope")
vim.keymap.set("n", "<leader>gb", git.checkout_branch)
vim.keymap.set("n", "<leader>gm", git.merge_branch)
vim.keymap.set("n", "<c-l>", "<cmd>nohlsearch|diffupdate|NoiceDismiss<cr>")
vim.keymap.set("i", "<c-y>", "copilot#Accept()", { expr = true, replace_keycodes = false })

vim.g.copilot_no_tab_map = true

vim.api.nvim_create_autocmd("ColorScheme", { pattern = "*", command = "highlight Normal   ctermbg=none guibg=none" } )
vim.api.nvim_create_autocmd("ColorScheme", { pattern = "*", command = "highlight NormalNC ctermbg=none guibg=none" } )
vim.cmd("colorscheme everforest")
