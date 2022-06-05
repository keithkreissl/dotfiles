"
"  Installation 
"    * Make sure to do brew install override the system-vi
"    * syntastic - syntax highlighting / linter
"    * vim-airline - cool layout of windows
"    * vim-colorschemes - more colors
"    * nerdtree - folder layout
"    * vim-gutter - show git changes
"    * vim-go - golang plugin
"    * shougo/deoplete
"    * roxma/nvim-yarp
"    * roxma/vim-hug-neovim-rpc
"    * vim-fugitive
"    * YankRing
"    * gundo - git undo
"

set pastetoggle=<F1>

call plug#begin()
    Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'rafi/awesome-vim-colorschemes'
    Plug 'tpope/vim-unimpaired'
    Plug 'rking/ag.vim'
call plug#end()

set nu

filetype plugin indent on

set expandtab

set shiftwidth=4
set softtabstop=4
set tabstop=4
set smartindent
set smarttab

nnoremap <silent> <F5> :NERDTreeToggle<CR>

set hlsearch
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

set cursorline
set cursorlineopt=number
autocmd ColorScheme * highlight CursorLineNr cterm=bold term=bold gui=bold

" easier switch to split
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l
nmap <C-k> <C-w>k
nmap <C-j> <C-w>j 

let g:airline_theme='atomic'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

colorscheme OceanicNext
