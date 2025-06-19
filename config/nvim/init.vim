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

lua require("config.lazy")
lua require("config.lsp")
lua require("config.telescope")

nnoremap <silent> <C-l> :nohlsearch<Bar>diffupdate<Bar>NoiceDismiss<CR>
inoremap <expr> <C-y> copilot#Accept()

let g:copilot_no_tab_map = v:true

autocmd ColorScheme * highlight Normal   ctermbg=none guibg=none
autocmd ColorScheme * highlight NormalNC ctermbg=none guibg=none

colorscheme everforest
