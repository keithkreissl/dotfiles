"
"  Installation 
"    * Make sure to do brew install override the system-vi
"    * pathogen - easier installation of plugins
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

set nu
set clipboard=unnamed

set shell=/bin/sh

"For eclim to work properly
" http://eclim.org/install.html
set nocompatible

set nowrap

set noswapfile

execute pathogen#infect()
syntax on

" indenting
" filetype indent on
" set expandtab       " Use softtabstop spaces instead of tab characters for
" indentation - abbr et
" set shiftwidth=4    " Indent by 4 spaces when using >>, <<, == etc. - abbr
" sw
" set softtabstop=4   " Indent by 4 spaces when pressing <TAB> - abbr sts
" set tabstop=4       " Indent by 4 spaces when pressing <TAB> - abbr ts
" set smartindent     " Automatically inserts indentation in some cases
" set smarttab        " A <Tab> in front of a line inserts blanks according to
" 'shiftwidth'.  'tabstop' or 'softtabstop' is used in other places.  A <BS>
" will delete a 'shiftwidth' worth of space at the start of the line.

filetype plugin indent on

set expandtab

set shiftwidth=4
set softtabstop=4
set tabstop=4
set smartindent
set smarttab

set showmode

set pastetoggle=<F1>

" NERDtree - http://vim.sourceforge.net/scripts/script.php?script_id=1658
nnoremap <silent> <F5> :NERDTreeToggle<CR>
autocmd vimenter * NERDTree | sleep 1m | :wincmd l | :only
" autocmd vimenter * NERDTree
 " let NERDTreeShowBookmarks=1

 " Gundo - http://sjl.bitbucket.org/gundo.vim/
nnoremap <silent> <F3> :GundoToggle<CR>

" easier switch to split
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l
nmap <C-k> <C-w>k
nmap <C-j> <C-w>j 

" syntastic
let g:syntastic_javascript_checkers = ['eslint'] "Use eslint for syntax checking
" Point syntastic checker at locally installed `eslint` if it exists.
if executable('node_modules/.bin/eslint')
	let b:syntastic_javascript_eslint_exec = getcwd()."/node_modules/.bin/eslint"
endif
let g:syntastic_go_checkers = ['golint', 'govet', 'errchk']
let g:syntastic_mode_map = { 'mode' : 'active', 'passive_filetypes' : ['go']}
let g:sysntastic_html_checkers = []
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
"let g:syntastic_debug = 33

"let vim_markdown_preview_hotkey='<F6>'
"let vim_markdown_preview_browser='Google Chrome'

nnoremap <leader>t :Typora<CR>
" Use deoplete.
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']

let g:deoplete#enable_smart_case = 1
let g:deoplete#sources#syntax#min_keyword_length = 3

" Airline
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#sysntastic#enabled = 1
let g:airline_theme='murmur'
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
nnoremap <C-X> :bdelete<CR>

" ctrlp.vim
nmap <leader>f :CtrlPBuffer<CR>
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
"
"
"" old vim-powerline symbols
if !exists('g:airline_symbols')
        let g:airline_symbols = {}
endif
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '⭡'

set laststatus=2
set noruler

" Wild menu
set wildmenu wildmode=list:longest,full

" intellisense
set omnifunc=syntaxcomplete#Complete
" The following command will change the 'completeopt' option so that Vim's
" popup menu doesn't select the first completion item, but rather just inserts
" the longest common text of all matches; and the menu will come up even if
" there's only one match. (The longest setting is responsible for the former
" effect and the menuone is responsible for the latter.)
set completeopt=longest,menuone

"let g:solarized_termcolors=256
"set background=light
colorscheme hybrid

" go vim
let g:go_metalinter_autosave = 1
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <leader>t <Plug>(go-test)

nnoremap <leader>r :source $MYVIMRC<CR>

"remove trailing whitespace for specific files
autocmd BufWritePre *.md %s/\s\+$//e

" grep override
" The Silver Searcher
if executable('ag')
    " Use ag over grep
    set grepprg=ag\ --nogroup\ --nocolor

    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

    " ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0

	" bind K to grep word under cursor
    nnoremap <leader>k :Ack! "\b<C-R><C-W>\b"<CR>:cw<CR>
    let g:ackprg = 'ag --vimgrep'
    cnoreabbrev Ack Ack!
    nnoremap <Leader>a :Ack!<Space>
endif

