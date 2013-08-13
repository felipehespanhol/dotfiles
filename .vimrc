set nocompatible

set encoding=utf-8
set fileencoding=utf-8

let mapleader=","

" let Vundle manage Vundle
set rtp+=~/.vim/bundle/vundle
call vundle#rc()
Bundle 'gmarik/vundle'

Bundle 'altercation/vim-colors-solarized'
Bundle 'kchmck/vim-coffee-script'
Bundle 'rizzatti/ctrlp.vim'
Bundle 'majutsushi/tagbar'
Bundle 'rizzatti/funcoo.vim'
Bundle 'rizzatti/greper.vim'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-rails'
Bundle 'scrooloose/nerdtree'
Bundle 'dhruvasagar/vim-table-mode'
Bundle 'godlygeek/tabular'
Bundle 'Lokaltog/powerline'

" Open vimrc with <leader>v
nmap <leader>v :edit $MYVIMRC<CR>
nmap <leader>sv :source $MYVIMRC<cr>

if &t_Co > 2 || has("gui_running")
  syntax enable
  set hlsearch
  nmap <silent> <leader>h :silent :nohlsearch<CR>
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COLORS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set t_Co=256
set background=dark
colorscheme solarized

filetype on
filetype plugin on
filetype indent on

" Tab spacing/size
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

" Screen offset
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

command! -nargs=* Wrap set wrap linebreak nolist
set backupdir=~/.vim/backup,~/tmp,/var/tmp,/tmp
set directory=~/.vim/backup,~/tmp,/var/tmp,/tmp

" %% as current dir
cnoremap %% <C-R>=expand("%:h")."/"<CR>

cnoremap cb 1,100bdelete
"
" %f as current file
cnoremap %f <C-R>=expand("%")<CR>

" Clear the search buffer when hitting return
function! MapCR()
  nnoremap <cr> :nohlsearch<cr>:redraw!<cr>
endfunction
call MapCR()
nnoremap <leader><leader> ^

set completeopt=menu,menuone,longest
set pumheight=10

set wildignore+=*/.hg/*,*/.svn/*
set wildignore+=*.o,moc_*.cpp,*.exe,*.qm
set wildignore+=.gitkeep,.DS_Store

" Toggle absolute/relative line number
map <leader>r :exec &nu==0 ? "set number" : "set relativenumber"<cr>

" Toggle paste mode with <leader>p
set pastetoggle=<leader>p
function! PasteCB()
  set paste
  set nopaste
endfunction

" Switch buffers with <leader>ea
map <leader>ea :b#<CR>

" Save/quit typos
cab W w| cab Q q| cab Wq wq| cab wQ wq| cab WQ wq| cab Bd bd| cab Wa wa| cab WA wa

autocmd CursorHold * checktime

inoremap jj <esc>

" Keep line index when reopening a file
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g`\"" |
  \ endif

" Sudo to write
cnoremap w!! w !sudo tee % >/dev/null

" Toggle invisible characters
map <leader>l :set list!<CR>

imap <c-l> <space>=><space>
map <leader>e :edit %%


" set winwidth=84
" set winheight=10
" set winminheight=10
" set winheight=999

" Surround word with separators
nnoremap <leader>" lbi"<esc>ei"<esc>lel
nnoremap <leader>' lbi'<esc>ei'<esc>lel
nnoremap <leader>( lbi(<esc>ei)<esc>lel
nnoremap <leader>[ lbi[<esc>ei]<esc>lel

"""""""""""""""""""""""
" WINDOW MANAGEMENT "
"""""""""""""""""""""""

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

nnoremap <leader>. :call OpenTestAlternate()<cr>
nnoremap <leader>s <c-w>o :call OpenTestAlternate()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FUNCTIONS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"function! OpenTestAlternate()
"  let new_file = AlternateForCurrentFile()
"  exec ':vsp ' . new_file
"endfunction
"function! AlternateForCurrentFile()
"  let current_file = expand("%")
"  let new_file = current_file
"  let in_spec = match(current_file, '^spec/') != -1
"  let going_to_spec = !in_spec
"  let in_app = match(current_file, '\<controllers\>') != -1 || match(current_file, '\<models\>') != -1 || match(current_file, '\<views\>') != -1 || match(current_file, '\<helpers\>') != -1
"  if going_to_spec
"    if in_app
"      let new_file = substitute(new_file, '^app/', '', '')
"    end
"    let new_file = substitute(new_file, '\.rb$', '_spec.rb', '')
"    let new_file = 'spec/' . new_file
"  else
"    let new_file = substitute(new_file, '_spec\.rb$', '.rb', '')
"    let new_file = substitute(new_file, '^spec/', '', '')
"    if in_app
"      let new_file = 'app/' . new_file
"    end
"  endif
"  return new_file
"endfunction
"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RUNNING TESTS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"map <leader>t :call RunTestFile()<cr>
"map <leader>T :call RunNearestTest()<cr>
"map <leader>a :call RunTests('')<cr>
"
"function! RunTestFile(...)
"    if a:0
"        let command_suffix = a:1
"    else
"        let command_suffix = ""
"    endif
"
"" Run the tests for the previously-marked file.
"    let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\)$') != -1
"    if in_test_file
"        call SetTestFile()
"    elseif !exists("t:grb_test_file")
"        return
"    end
"    call RunTests(t:grb_test_file . command_suffix)
"endfunction
"
"function! RunNearestTest()
"    let spec_line_number = line('.')
"    call RunTestFile(":" . spec_line_number . " -b")
"endfunction
"
"function! SetTestFile()
"" Set the spec file that tests will be run for.
"    let t:grb_test_file=@%
"endfunction
"
"function! RunTests(filename)
"" Write the file and run tests for the given filename
"    :w
"    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
"    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
"    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
"    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
"    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
"    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
"    if match(a:filename, '\.feature$') != -1
"        exec ":!script/features " . a:filename
"    else
"        if filereadable("zeus.json")
"            exec ":!zeus rspec " . a:filename
"        elseif filereadable("script/test")
"            exec ":!script/test " . a:filename
"        elseif filereadable("Gemfile")
"            exec ":!bundle exec rspec --color " . a:filename
"        else
"            exec ":!rspec --color " . a:filename
"        end
"    end
"endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGINS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""
" CtrlP "
""""""""""""
" Open buffer with <C-B>
nmap <C-B> :CtrlPBuffer<cr>
let g:ctrlp_custom_ignore='\.git$\|\.pdf$'
let g:ctrlp_use_caching = 0
let g:ctrlp_max_height=5
let g:ctrlp_extensions=['quickfix']
let g:ctrlp_user_command={
  \ 'types' : {
    \ 1: ['.git', 'cd %s && git ls-tree -r HEAD | grep -v -e "^\d\+\scommit" | cut -f 2']
    \ },
  \ 'fallback': 'find %s -name "tmp" -prune -o -print'
  \ }
nnoremap <C-f> :CtrlPFallback<CR>


""""""""""""
" Gist "
""""""""""""
"let g:gist_open_browser_after_post = 1
"let g:gist_post_private = 1
"let g:gist_detect_filetype = 1
"let g:gist_clip_command = 'xclip -selection clipboard'
"let g:github_token = $GITHUB_TOKEN

""""""""""""
" CTags "
""""""""""""
"set tags+=gems.tags

"nnoremap <F5> :GundoToggle<CR>
"nnoremap <F8> :TagbarToggle<CR>
nnoremap <C-n> :NERDTreeToggle<CR>

"""""""""""""
" Powerline "
"""""""""""""
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
set noshowmode
set laststatus=2

"""""""""""""
" Greper "
"""""""""""""
"nmap <silent> <leader>a <Plug>GreperBangWord\|<C-w>p
"nmap <silent> <leader>A <Plug>GreperBangWORD\|<C-w>p

"""""""""""
" Tabular "
"""""""""""
if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
endif

" Custom
nnoremap gr :tabprevious<CR>