set number relativenumber
set cursorline colorcolumn=120 nowrap
set conceallevel=0
set list listchars=tab:»\ ,trail:·
set completeopt=menuone,noinsert
set grepprg=rg\ --vimgrep\ --ignore-case\ -e grepformat=%f:%l:%c:%m
set ignorecase smartcase wildignorecase noexpandtab
set tabstop=4 shiftwidth=0
set nowritebackup
set mouse=

let g:mapleader = " "
lua require("config.pack")
lua require("config.lsp")
lua require("config.dap")

autocmd ColorScheme * highlight Normal   ctermbg=none guibg=none
autocmd ColorScheme * highlight NormalNC ctermbg=none guibg=none

colorscheme everforest
