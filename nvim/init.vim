filetype on
filetype plugin on
filetype indent on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Plug
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'dhruvasagar/vim-table-mode'
Plug 'godlygeek/tabular'
Plug 'moll/vim-bbye'
Plug 'StanAngeloff/php.vim'
Plug 'Raimondi/delimitMate'
Plug 'alvan/vim-closetag'
" UI
Plug 'altercation/vim-colors-solarized'
Plug 'bling/vim-airline'
Plug 'edkolev/tmuxline.vim'
" Tags
Plug 'szw/vim-tags'
Plug 'majutsushi/tagbar'
" Rails
Plug 'kchmck/vim-coffee-script'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-endwise'
Plug 'slim-template/vim-slim'
" Greper
Plug 'rizzatti/funcoo.vim'
Plug 'rizzatti/greper.vim'
" Snippets and its dependencies
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
" LaTeX
Plug 'gerw/vim-latex-suite'
Plug 'xuhdev/vim-latex-live-preview'
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" REMAPPINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader=","

" Open vimrc with <leader>v
nmap <leader>v  :edit   $MYVIMRC<CR>
nmap <leader>sv :source $MYVIMRC<CR>

nnoremap <C-f> :CtrlPFallback<CR>
nnoremap <C-n> :NERDTreeToggle<CR>:setlocal relativenumber<CR>
":vertical resize 50<CR>

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
nnoremap <cr> :nohlsearch<cr>:redraw!<cr>
nnoremap <leader><leader> ^

" Tabular
if exists(":Tabularize")
  nnoremap <leader>t= :Tabularize /=<CR>
  vnoremap <leader>t= :Tabularize /=<CR>
  nnoremap <leader>t: :Tabularize /:\zs<CR>
  vnoremap <leader>t: :Tabularize /:\zs<CR>
endif

" Toggle absolute/relative line number
map <leader>r :set number!<CR>:set relativenumber!<cr>

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
nmap <C-g> :G! 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COLORS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set t_Co=256
colorscheme solarized
let s:uname = system("echo -n \"$(uname)\"")
if !v:shell_error && s:uname =~ "Darwin"
  set background=light
else
  set background=dark
endif

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

"set encoding=utf-8
"set fileencoding=utf-8

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
let g:ctrlp_custom_ignore='\.git$\|\.pdf$|.log$'
let g:ctrlp_use_caching = 0
let g:ctrlp_max_height=5
let g:ctrlp_extensions=['quickfix']

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ctags "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set tags=./tags;

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OTHER CONFIG "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set backupdir=~/.vim/backup,~/tmp,/var/tmp,/tmp
set directory=~/.vim/backup,~/tmp,/var/tmp,/tmp

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LaTeX "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:Tex_CompileRule_dvi='lualatex -interaction=nonstopmode $*'
let g:Tex_CompileRule_ps='ps2pdf $*'
let g:Tex_CompileRule_pdf='lualatex -interaction=nonstopmode $*'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim CloseTag "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.php,*.erb"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim DelimitMate "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let delimitMate_expand_cr = 2
au FileType html let b:delimitMate_matchpairs = "(:),[:],{:}"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Snipmate "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Airline "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:airline_powerline_fonts = 1
