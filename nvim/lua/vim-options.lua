vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set relativenumber")
vim.cmd("set splitbelow")
vim.cmd("set splitright")
vim.cmd("set listchars=space:·,tab:->\\")

-- Leader key
vim.g.mapleader = ","

-- Open init.lua
vim.keymap.set('n', '<leader>v', ':edit ~/.config/nvim/lua/vim-options.lua<CR>')

-- vim.keymap.set('n', '<C-n> :call NERDTreeExpand()<CR>', ':set relativenumber<CR>')

-- Buffers
vim.keymap.set('n', '<F4>', ':%bdelete<CR>') -- Delete all buffers
vim.keymap.set('', '<leader>ea', ':b#<CR>') -- Go back to previous buffer

-- Resize
vim.keymap.set('n', '<C-Up>', '<C-w>5+')
vim.keymap.set('n', '<C-Down>', '<C-w>5-')
vim.keymap.set('n', '<C-Left>', '<C-w>5>')
vim.keymap.set('n', '<C-Right>', '<C-w>5<')

-- Move around
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-l>', '<C-w>l')
vim.keymap.set('n', '<leader><leader>', '^')

-- Tabs
vim.keymap.set('n', 'gr', ':tabprevious<CR>')
vim.keymap.set('n', '<TAB>', ':tabn<CR>')
vim.keymap.set('n', '<S-TAB>', ':tabp<CR>')

-- Redraw on Enter
vim.keymap.set('n', '<cr>', ':nohlsearch<CR>:redraw!<CR>:echo expand("%:p")<CR>')

-- Ruler
vim.keymap.set('', '<leader>r', ':set number!<CR>:set relativenumber!<CR>')

-- White spaces
vim.keymap.set('n', '<leader>l', ':set list!<CR>')
