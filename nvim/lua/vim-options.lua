vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.listchars = { space = "·", tab = "->\\" }

vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

-- Leader key
vim.g.mapleader = ","

-- Buffers
vim.keymap.set('n', '<F4>', ':%bdelete<CR>') -- Delete all buffers
vim.keymap.set('', '<leader>ea', ':b#<CR>') -- Go back to previous buffer
-- use :bnext and :bprev to navigate buffers, or [b and ]b if you prefer

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

-- Session management
vim.keymap.set(
  'n', '<leader>ss', ':mksession! ~/.local/nvim/session.vim<CR>:echo "Session saved succesfully in ~/.local/nvim/session.vim!"<CR>',
  { desc = 'Save session' }
)
vim.keymap.set('n', '<leader>sr', ':source ~/.local/nvim/session.vim<CR>', { desc = 'Load session' })

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

-- Copy all file content to clipboard
vim.keymap.set('n', 'yaf', ':%y+<CR>', { desc = 'Yank entire file to clipboard' })

-- Open NeoVIM config
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

-- Copy absolute path of current file
vim.keymap.set('n', '<leader>cp', function()
  local name = vim.api.nvim_buf_get_name(0)
  if name == '' then
    vim.notify('No file name for this buffer', vim.log.levels.WARN)
    return
  end
  local path = vim.fn.fnamemodify(name, ':.:')      -- relative path
  vim.fn.setreg('+', path)                         -- system clipboard (macOS)
  vim.fn.setreg('*', path)                         -- optional (primary selection)
  vim.notify('Copied: ' .. path)
end, { desc = 'Copy current file path' })


