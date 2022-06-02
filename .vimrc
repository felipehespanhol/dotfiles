set nocompatible

filetype on
filetype plugin on
filetype indent on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Plug
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Install vim-plug if not present
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" File Search
" Plug 'ctrlpvim/ctrlp.vim'
" FZF plugin needs fzf binary. Look for fzf in arch repositories
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'scrooloose/nerdtree'

" Syntax and identation for many languages
Plug 'sheerun/vim-polyglot'

" Linting
Plug 'dense-analysis/ale'

" Draw tables
Plug 'godlygeek/tabular' " plasticboy/vim-markdown depends on this

" Markdown support
Plug 'plasticboy/vim-markdown' " has dependency on 'godlygeek/tabular'

" Dealing with quotes, parenthesis, tags, etc...
Plug 'Raimondi/delimitMate'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-ragtag'

" Comments
Plug 'scrooloose/nerdcommenter'

" UI
" Plug 'lifepillar/vim-solarized8'
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
Plug 'matthewsimo/angular-vim-snippets'

" LaTeX
Plug 'gerw/vim-latex-suite'
"Plug 'xuhdev/vim-latex-live-preview'

" Rails
Plug 'kchmck/vim-coffee-script'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-endwise'
Plug 'thoughtbot/vim-rspec'
Plug 'https://github.com/slim-template/vim-slim.git'

" Ionic
Plug 'akz92/vim-ionic2'

" Git
Plug 'zivyangll/git-blame.vim'

" Table mode
Plug 'dhruvasagar/vim-table-mode' " use <leader>tm to toggle it

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" REMAPPINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader=","

" Open vimrc with <leader>v
nmap <leader>v  :edit   ~/.vimrc<CR>
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

" Buffers
" Return to previous file with <leader>ea
map <leader>ea :b#<CR>
" Go to next buffer with <F12>
nmap <F12> :bn<CR>
" Return to previous buffer with <F10>
nmap <F10> :bp<CR>
" Cleanup buffers with <F4>
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

" Resize
noremap <C-Up> <C-w>5+
noremap <C-Down> <C-w>5-
noremap <C-Left> <C-w>5>
noremap <C-Right> <C-w>5<

" Move around
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-h> <C-w>h
noremap <C-l> <C-w>l

" vabs
nnoremap gr :tabprevious<CR>
nnoremap <TAB> :tabn<CR>
nnoremap <S-TAB> :tabp<CR>

" Greper
"nmap <silent> <leader>a <Plug>GreperBangWord\|<C-w>p
"nmap <silent> <leader>A <Plug>GreperBangWORD\|<C-w>p
nmap <leader>a <Plug>AgActionWord
vmap <leader>a <Plug>AgActionVisual
nnoremap <C-g> :Ag! 

let g:vim_action_ag_escape_chars = '#%.^$*+?()[{\\|'

" RSpec
map <Leader>t :call RunCurrentSpecFile()<CR>

" Copy to clipboard
nnoremap <leader>* "+yiw

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COLORS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

colorscheme solarized

set background=dark
" set background=light

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

" set sidescroll=8
" set scrolloff=8
" 
" set formatprg=par\ -TbgqRw80
" set autoindent
" set smartindent
set ignorecase " ignore case when searching
" set smartcase
" set incsearch
" set showmatch
" set matchtime=2
set ruler "show cursor pos on status bar
set relativenumber " show line number
" set autoread
" set wildmenu
" set wildmode=list:longest
" set shortmess=atI
" set timeoutlen=500
" set wrap
"set wrapmargin=100
set colorcolumn=100
" set visualbell "no crazy beeping
" set hidden
" set title
" set cc=+1
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

" autocmd CursorHold * checktime
" 
" " Keep line index when reopening a file
" autocmd BufReadPost *
"   \ if line("'\"") > 0 && line("'\"") <= line("$") |
"   \ exe "normal g`\"" |
"   \ endif
" 
" command! -nargs=* Wrap set wrap linebreak nolist

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDCommenter
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FZF fuzzy search "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nmap <C-P> :FZF<CR>
nmap <C-B> :Buffers<CR>
nmap <C-i> :History<CR>

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

" Use new regular expression engine to fix slowlyness
set re=0
" Disable auto highlighting of matched parentheses for performance
set noshowmatch

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
" Vim TableMode "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:table_mode_corner_corner='+'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Snipmate "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:snipMate = get(g:, 'snipMate', {}) " Allow for vimrc re-sourcing
let g:snipMate.scope_aliases = {}
let g:snipMate.scope_aliases['javascript'] = 'javascript,html'
let g:snipMate = { 'snippet_version' : 1 }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Airline "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:airline_powerline_fonts = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Config Linters "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Pretty XML
au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null
" Pretty JSON
" %!python -m json.tool

" Set specific linters
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'ruby': ['rubocop', 'standardrb']
\}
let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'ruby': ['rubocop']
\}

let g:ale_fix_on_save = 0
" let g:ale_linters_explicit = 1
let g:airline#extensions#ale#enabled = 1
"let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COC "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nmap <silent> gd <Plug>(coc-definition)
" nmap <buffer> <leader>gd <Plug>(coc-definition)


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Git blame "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <Leader>s :<C-u>call gitblame#echo()<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-ruby "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Prevents conflict with standard ruby gem
let g:ruby_indent_assignment_style = 'variable'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Markdown config "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0
