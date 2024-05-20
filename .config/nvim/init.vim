set number relativenumber
set cursorline colorcolumn=120 nowrap
set list listchars=tab:»\ ,trail:·
set completeopt=menuone,noinsert
set grepprg=rg\ --vimgrep\ --ignore-case\ -e grepformat=%f:%l:%c:%m
set ignorecase smartcase wildignorecase noexpandtab
set tabstop=4 shiftwidth=0
set nowritebackup
set mouse=

inoremap <expr><c-j> coc#pum#visible() ? coc#pum#next(1) : '<down>'
inoremap <expr><c-k> coc#pum#visible() ? coc#pum#prev(1) : '<up>'
nnoremap <silent>K   :call CocAction('definitionHover')<cr>
nnoremap <silent>gd  <Plug>(coc-definition)
nnoremap <silent>gr  <Plug>(coc-references)
nnoremap <silent>gR  <Plug>(coc-rename)
nnoremap <silent>gca <Plug>(coc-codeaction-selected)

call plug#begin()
	Plug 'junegunn/fzf'
	Plug 'junegunn/fzf.vim'
	Plug 'mattia72/vim-delphi'
	Plug 'neoclide/coc.nvim', { 'branch': 'release' }
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

lua require("oil").setup()
