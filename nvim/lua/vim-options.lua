vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set relativenumber")
vim.cmd("set number")
vim.cmd("set splitbelow")
vim.cmd("set splitright")
vim.cmd("set listchars=space:·,tab:->\\")

vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

-- Leader key
vim.g.mapleader = ","

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
vim.keymap.set('n', 'gr', ':tabp<CR>')
vim.keymap.set('n', '<TAB>', ':tabn<CR>')
vim.keymap.set('n', '<S-TAB>', ':tabp<CR>')

-- Redraw on Enter
vim.keymap.set('n', '<cr>', ':nohlsearch<CR>:redraw!<CR>:echo expand("%:p")<CR>')

-- Ruler
local function toggle_relative_numbers()
  if vim.wo.relativenumber then
    vim.wo.relativenumber = false
    vim.wo.number = true
  else
    vim.wo.relativenumber = true
    vim.wo.number = true  -- keep showing absolute number for current line
  end
end
vim.keymap.set('n', '<leader>r', toggle_relative_numbers, { desc = 'Toggle relative line numbers' })

-- White spaces
vim.keymap.set('n', '<leader>l', ':set list!<CR>')

-- Open NeoVIM config: edit init.lua
vim.keymap.set('n', '<leader>v', ':edit ~/.config/nvim/lua/vim-options.lua<CR>')

-- Reload NeoVIM config
vim.keymap.set('n', '<leader>sv', function()
  -- Save changes first
  if vim.bo.modified then
    vim.cmd.write()
  end

  -- Clear lazy.nvim cache
  require('lazy.core.cache').reset()

  -- Reload just the init.lua
  vim.cmd('luafile ' .. vim.fn.stdpath('config') .. '/init.lua')

  vim.notify('Config reloaded!', vim.log.levels.INFO)
end, { desc = 'Reload config' })
