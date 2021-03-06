set nocompatible

filetype on
filetype plugin on
filetype indent on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Plug
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Install it with
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.vim/plugged')

" File Search
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'dhruvasagar/vim-table-mode' " use <leader>tm to toggle it

" Draw tables
Plug 'godlygeek/tabular'

" Dealing with quotes, parenthesis, tags, etc...
Plug 'Raimondi/delimitMate'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-ragtag'

" Comments
Plug 'scrooloose/nerdcommenter'

" React
Plug 'MaxMEllon/vim-jsx-pretty'

" UI
Plug 'lifepillar/vim-solarized8'
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'Yggdroot/indentLine'

" Tags
Plug 'szw/vim-tags'
Plug 'majutsushi/tagbar'

" Greper
"Plug 'rizzatti/funcoo.vim'
"Plug 'rizzatti/greper.vim'
" The Silver Searcher
Plug 'rking/ag.vim'
Plug 'Chun-Yang/vim-action-ag'

" Snippets and its dependencies
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'felipehespanhol/vim-phaser-snippets'

" LaTeX
Plug 'gerw/vim-latex-suite'
"Plug 'xuhdev/vim-latex-live-preview'

" PHP
Plug 'StanAngeloff/php.vim'

" Elixir
Plug 'elixir-lang/vim-elixir'

" Go lang
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Rails
Plug 'kchmck/vim-coffee-script'
Plug 'tpope/vim-haml'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-endwise'
Plug 'thoughtbot/vim-rspec'
Plug 'https://github.com/slim-template/vim-slim.git'

" Typescript
Plug 'leafgarland/typescript-vim'
Plug 'akz92/vim-ionic2'
Plug 'matthewsimo/angular-vim-snippets'

" VueJS
Plug 'posva/vim-vue'

" Linting
Plug 'dense-analysis/ale'

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" REMAPPINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader=","

" Open vimrc with <leader>v
nmap <leader>v  :edit   $MYVIMRC<CR>
nmap <leader>sv :source $MYVIMRC<CR>

" %% as current dir
cnoremap %% <C-R>=expand("%:h")."/"<CR>

" %f as current file
cnoremap %f <C-R>=expand("%")<CR>

function! NERDTreeExpand()
  if expand("%") == ""
    NERDTreeToggle
  else
    NERDTreeToggle %
  endif
endfunction
nnoremap <C-n> :call NERDTreeExpand()<CR>:set relativenumber<CR>

":vertical resize 50<CR>

" Switch buffers with <leader>ea
map <leader>ea :b#<CR>
nmap <F12> :bn<CR>
nmap <F10> :bp<CR>
nmap <F4> :%bdelete<CR>

if &t_Co > 2 || has("gui_running")
  syntax enable
  set hlsearch
  nmap <silent> <leader>h :silent :nohlsearch<CR>
endif

" Clear the search buffer when hitting return
nnoremap <cr> :nohlsearch<cr>:redraw!<cr>
nnoremap <leader><leader> ^

" Tabular
"if exists(":Tabularize")
  nnoremap <leader>t= :Tabularize /=<CR>
  vnoremap <leader>t= :Tabularize /=<CR>
  nnoremap <leader>t: :Tabularize /:\zs<CR>
  vnoremap <leader>t: :Tabularize /:\zs<CR>
  nnoremap <leader>t> :Tabularize /=><CR>
  vnoremap <leader>t> :Tabularize /=><CR>
"endif

inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.', position),'ce',line('.'))
  endif
endfunction

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
"nmap <silent> <leader>a <Plug>GreperBangWord\|<C-w>p
"nmap <silent> <leader>A <Plug>GreperBangWORD\|<C-w>p
nmap <leader>a <Plug>AgActionWord
vmap <leader>a <Plug>AgActionVisual
nnoremap <C-g> :Ag! 

let g:vim_action_ag_escape_chars = '#%.^$*+?()[{\\|'

" RSpec
map <Leader>t :call RunCurrentSpecFile()<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COLORS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Solarized8
"set t_Co=256
"let g:solarized_use16 = 1
"colorscheme solarized8

" Old Solarized
colorscheme solarized

set background=dark
"set background=light

let s:uname = system("echo -n \"$(uname)\"")

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tmuxline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"let g:tmuxline_preset = 'nightly_fox'
let g:tmuxline_preset = {
      \'a'    : '#H',
      \'b'    : '#S',
      \'c'    : '#W',
      \'win'  : '#I #W',
      \'cwin' : '#I #W',
      \'x'    : '%a',
      \'y'    : '%R',
      \'z'    : 'BAT #(cat /sys/class/power_supply/BAT0/capacity)%'}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TAB SPACING/SIZE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set tabstop=2     "number of spaces on tab
set shiftwidth=2  "number of spaces to ident
set softtabstop=2
set expandtab     "convert tabs to spaces
set smarttab

set backspace=indent,eol,start
set listchars=tab:▸▸,eol:¬,trail:·,precedes:«,extends:»
"set textwidth=80
set linebreak
set showbreak=…

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SCREEN
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set encoding=utf-8
set fileencoding=utf-8
scriptencoding utf-8

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
set colorcolumn=80
set visualbell "no crazy beeping
set hidden
set title
set cc=+1
set mouse=a

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
  set paste!
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
" NERDCommenter
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlP "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Open buffer with <C-B>
nmap <C-B> :CtrlPBuffer<cr>
let g:ctrlp_custom_ignore='\.git$\|\.pdf$|.log$'
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn)|vendor\/assets\/components$',
    \ 'file': '\v\.(exe|so|dll)$',
    \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
    \ }
let g:ctrlp_use_caching = 30000
"let g:ctrlp_max_height=5
"let g:ctrlp_extensions=['quickfix']
"let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
let g:ctrlp_cmd = 'CtrlPMixed'
if executable('rg')
  let g:ctrlp_user_command = 'rg %s --files --hidden --color=never --glob ""'
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ctags "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set tags=./tags;

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OTHER CONFIG "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set backupdir=~/.vim/backup,~/tmp,/var/tmp,/tmp
set directory=~/.vim/backup,~/tmp,/var/tmp,/tmp
runtime macros/matchit.vim

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LaTeX "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:Tex_CompileRule_dvi='lualatex -interaction=nonstopmode $*'
let g:Tex_CompileRule_ps='ps2pdf $*'
let g:Tex_CompileRule_pdf='lualatex -interaction=nonstopmode $*'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim CloseTag "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.php,*.erb,*.vue"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim DelimitMate "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let delimitMate_expand_cr = 2
au FileType html,vue let b:delimitMate_matchpairs = "(:),[:],{:}"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Snipmate "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:snipMate = get(g:, 'snipMate', {}) " Allow for vimrc re-sourcing
let g:snipMate.scope_aliases = {}
let g:snipMate.scope_aliases['javascript'] = 'javascript,html'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Airline "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:airline_powerline_fonts = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Config Linters "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null

" Set specific linters
let g:ale_linters = {
 \   'javascript': ['eslint'],
 \   'ruby': ['rubocop']
 \}
let g:ale_linters_explicit = 1
let g:airline#extensions#ale#enabled = 1
"let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
