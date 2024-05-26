set number
set relativenumber
set autoindent
set tabstop=4
set shiftwidth=4
set smarttab
set softtabstop=4
set mouse=a
set termguicolors
set encoding=UTF-8
set wildmenu
set incsearch
set smartindent
set guicursor=n-v-c:block-nCursor
set clipboard=unnamedplus
set colorcolumn=80
set belloff=all

try
    set undodir=~/.vim_runtime/temp_dirs/undodir
    set undofile
catch
endtry

let mapleader = " "

map <C-S> :w<CR>
map <leader>t :Ex<CR>
map <leader>d :bdelete!<CR>
map <leader>y "+y
map <leader>yy "+yy
map <leader>r :registers<CR>
map <leader>b :buffers<CR>

colorscheme rosepine

call plug#begin()
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'machakann/vim-highlightedyank'
Plug 'mbbill/undotree'
Plug 'ryanoasis/vim-devicons'
Plug 'flazz/vim-colorschemes'
call plug#end()

let g:highlightedyank_highlight_duration = 200

map <leader>e :UndotreeToggle<CR>

autocmd FileType cpp,c setlocal tabstop=2 shiftwidth=2
