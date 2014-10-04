set nocompatible

filetype on
filetype plugin on
filetype indent on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VUNDLE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" let Vundle manage Vundle
set rtp+=~/.vim/bundle/vundle
call vundle#begin()
Plugin 'gmarik/vundle'
Plugin 'altercation/vim-colors-solarized'
Plugin 'kchmck/vim-coffee-script'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'rizzatti/funcoo.vim'
Plugin 'rizzatti/greper.vim'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-rails'
Plugin 'scrooloose/nerdtree'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'godlygeek/tabular'
Plugin 'Lokaltog/powerline'
Plugin 'moll/vim-bbye'
" Snippets and its dependencies
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
call vundle#end()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" REMAPPINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader=","

" Open vimrc with <leader>v
nmap <leader>v  :edit   $MYVIMRC<CR>
nmap <leader>sv :source $MYVIMRC<CR>

nnoremap <C-f> :CtrlPFallback<CR>
nnoremap <C-n> :NERDTreeToggle<CR>

" Switch buffers with <leader>ea
map <leader>ea :b#<CR>
nmap <F12> :bn<CR>
nmap <F10> :bp<CR>
nmap <F4> :Bdelete<CR>

if &t_Co > 2 || has("gui_running")
  syntax enable
  set hlsearch
  nmap <silent> <leader>h :silent :nohlsearch<CR>
endif

" %% as current dir
cnoremap %% <C-R>=expand("%:h")."/"<CR>

" %f as current file
cnoremap %f <C-R>=expand("%")<CR>

" Clear the search buffer when hitting return
function! MapCR()
  nnoremap <cr> :nohlsearch<cr>:redraw!<cr>
endfunction
call MapCR()
nnoremap <leader><leader> ^

" Tabular
if exists(":Tabularize")
  nmap <leader>t= :Tabularize /=<CR>
  vmap <leader>t= :Tabularize /=<CR>
  nmap <leader>t: :Tabularize /:\zs<CR>
  vmap <leader>t: :Tabularize /:\zs<CR>
endif

" Toggle absolute/relative line number
map <leader>r :exec &nu==0 ? "set number" : "set relativenumber"<cr>

imap <c-l> <space>=><space>
map <leader>e :edit %%

" Surround word with separators
nnoremap <leader>" lbi"<esc>ea"<esc>lel
nnoremap <leader>' lbi'<esc>ea'<esc>lel
nnoremap <leader>( lbi(<esc>ea)<esc>lel
nnoremap <leader>[ lbi[<esc>ea]<esc>lel

" Sudo to write
cnoremap w!! w !sudo tee % >/dev/null

" Toggle invisible characters
map <leader>l :set list!<CR>

" WINDOW MANAGEMENT

" Split
noremap <C-\> :vsp<CR>
noremap <C--> :sp<CR>

" Resize
noremap <Up> <C-w>+
noremap <Down> <C-w>-
noremap <Left> <C-w>>
noremap <Right> <C-w><

" Move around
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-h> <C-w>h
noremap <C-l> <C-w>l

nnoremap gr :tabprevious<CR>

" Greper
nmap <silent> <leader>a <Plug>GreperBangWord\|<C-w>p
nmap <silent> <leader>A <Plug>GreperBangWORD\|<C-w>p
nnoremap <C-g> :!G 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COLORS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set t_Co=256
set background=dark
colorscheme solarized

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TAB SPACING/SIZE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set tabstop=2 "number of spaces on tab
set shiftwidth=2 "number of spaces to ident
set softtabstop=2
set expandtab "convert tabs to spaces
set smarttab

set backspace=indent,eol,start
set listchars=tab:▸\ ,eol:¬,trail:·,precedes:«,extends:»
"set textwidth=80
set linebreak
set showbreak=…

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SCREEN
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set encoding=utf-8
set fileencoding=utf-8

set sidescroll=8
set scrolloff=8

set formatprg=par\ -TbgqRw80
set autoindent
set smartindent
set ignorecase "ignore case when searching
set smartcase
set incsearch
set showmatch
set matchtime=2
set ruler "show cursor pos on status bar
set relativenumber "show line number
set autoread
set wildmenu
set wildmode=list:longest
set shortmess=atI
set timeoutlen=500
set wrap
"set wrapmargin=80
set visualbell "no crazy beeping
set hidden
set title
set cc=+1

" Custom
set splitbelow
set splitright

set completeopt=menu,menuone,longest
set pumheight=10

set wildignore+=*/.hg/*,*/.svn/*
set wildignore+=*.o,moc_*.cpp,*.exe,*.qm
set wildignore+=.gitkeep,.DS_Store

" Toggle paste mode with <leader>p
set pastetoggle=<leader>p
function! PasteCB()
  set paste
  set nopaste
endfunction

" Save/quit typos
cab W w| cab Q q| cab Wq wq| cab wQ wq| cab WQ wq| cab Bd bd| cab Wa wa| cab WA wa

autocmd CursorHold * checktime

" Keep line index when reopening a file
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g`\"" |
  \ endif

command! -nargs=* Wrap set wrap linebreak nolist

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlP "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Open buffer with <C-B>
nmap <C-B> :CtrlPBuffer<cr>
let g:ctrlp_custom_ignore='\.git$\|\.pdf$|\.log$'
let g:ctrlp_use_caching = 0
let g:ctrlp_max_height=5
let g:ctrlp_extensions=['quickfix']
let g:ctrlp_user_command={
  \ 'types' : {
    \ 1: ['.git', 'cd %s && git ls-tree -r HEAD | grep -v -e "^\d\+\scommit" | cut -f 2']
    \ },
  \ 'fallback': 'find %s -name "tmp" -prune -o -print'
  \ }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Powerline "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
set noshowmode
set laststatus=2

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ctags "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set tags=./tags;

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OTHER CONFIG "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set backupdir=~/.vim/backup,~/tmp,/var/tmp,/tmp
set directory=~/.vim/backup,~/tmp,/var/tmp,/tmp
