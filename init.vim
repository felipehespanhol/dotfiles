" Plugins
call plug#begin('~/.config/nvim/plugged')
	" File navigation
	Plug 'preservim/nerdtree'
	Plug 'ryanoasis/vim-devicons'

	" LSP and snippets
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	Plug 'neovim/nvim-lspconfig'
	Plug 'hrsh7th/nvim-compe' 
	Plug 'hrsh7th/vim-vsnip'

	" Fuzzy file search
	Plug 'nvim-lua/popup.nvim' " required for Telescope
	Plug 'nvim-lua/plenary.nvim' " required for Telescope
	Plug 'nvim-telescope/telescope.nvim' " OS dependencies: ripgrep and fd

	" Easy parenthesis, quotation marks, etc...
	Plug 'tpope/vim-endwise'
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-repeat' " repeat commands of vim-surround with '.'

	" Rails
	Plug 'vim-test/vim-test'
	Plug 'tpope/vim-dispatch' " Run tests in split pane
	Plug 'tpope/vim-rails'

	" Appearance
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'edkolev/tmuxline.vim'
	Plug 'habamax/vim-gruvbit' " Color scheme

	" Git
	Plug 'tpope/vim-fugitive' " Branch name for airline
call plug#end()

" -- Basic configuration
" Enable ruler
set ru
" Show the line number
set relativenumber
" Enable Syntax Highlighting
syntax enable
" Enable using the mouse to click or select some piece of of code
set mouse=a
" Set tab to 2 spaces
set tabstop=2
set shiftwidth=2
" Ignore case on searches
set ignorecase
" Column to inform expected end of line
set colorcolumn=100

" set wildignore+=*/.hg/*,*/.svn/*
" set wildignore+=*.o,moc_*.cpp,*.exe,*.qm
" set wildignore+=.gitkeep,.DS_Store

" --- Gruvbit ---

set termguicolors
colorscheme gruvbit


" --- Vim Airline ---

let g:airline#extensions#branch#enabled=1
let g:airline_powerline_fonts = 1
let g:airline_theme='minimalist'


" --- Tmux line ---

let g:tmuxline_preset = {
    \'a'    : '#H',
    \'b'    : '#S',
    \'c'    : '#W',
    \'win'  : '#I #W',
    \'cwin' : '#I #W',
    \'x'    : '%a',
    \'y'    : '%R',
    \'z'    : 'BAT #(cat /sys/class/power_supply/BAT0/capacity)%'}


" --- vim-test configuration ---

let test#strategy = "dispatch"


" --- Remappings ---

let mapleader=','

nmap <C-n> :NERDTreeFind<CR>
nmap gr :tabprevious<CR>

nnoremap <C-p> <cmd>Telescope find_files<CR>
nnoremap <C-g> <cmd>Telescope live_grep<CR>
nnoremap <C-b> <cmd>Telescope buffers<CR>
nnoremap <leader>h <cmd>Telescope oldfiles<CR>
nnoremap <leader>a <cmd>Telescope grep_string<CR>

" Move around
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l
nmap <C-k> <C-w>k
nmap <C-j> <C-j>j

" Resize
noremap <C-Up> <C-w>5+
noremap <C-Down> <C-w>5-
noremap <C-Left> <C-w>5>
noremap <C-Right> <C-w>5<

" Toggle absolute/relative line number
map <leader>r :set number!<CR>:set relativenumber!<cr>

" Clear the search buffer when hitting return
nmap <cr> :nohlsearch<cr>:redraw!<cr>

" Easy quit
nmap <C-q> :q<CR>

" vim-test remappings
nnoremap <silent> <Leader>t :TestFile<CR>
nnoremap <silent> <Leader>s :TestNearest<CR>
nnoremap <silent> <Leader>l :TestLast<CR>

" Toggle invisible characters
map <leader>l :set list!<CR>

" Edit init.vim with <leader>v
nmap <leader>v  :edit   ~/.config/nvim/init.vim<CR>
" Reload vimrc with <leader>sv
nmap <leader>sv :source ~/.config/nvim/init.vim<CR>
" Return to previous file
map <leader>ea :b#<CR>


" --- LSP configuration ---

lua << EOF
require'lspconfig'.solargraph.setup{}

local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  -- buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "solargraph" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
}
end
EOF

" --- Compe configuration with LSP ---

lua << EOF
vim.o.completeopt = "menuone,noselect"

require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = false;

  source = {
    path = true;
    buffer = true;
    calc = true;
    vsnip = true;
    nvim_lsp = true;
    nvim_lua = true;
    spell = true;
    tags = true;
    snippets_nvim = true;
    treesitter = true;
  };
}
local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif vim.fn.call("vsnip#available", {1}) == 1 then
    return t "<Plug>(vsnip-expand-or-jump)"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
    return t "<Plug>(vsnip-jump-prev)"
  else
    -- If <S-Tab> is not working in your terminal, change it to <C-h>
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
EOF
