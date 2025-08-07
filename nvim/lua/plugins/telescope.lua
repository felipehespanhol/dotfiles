return {
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
  -- or                              , branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local builtin = require("telescope.builtin")
      vim.keymap.set('n', '<C-p>', builtin.find_files, {})
      vim.keymap.set('n', '<C-g>', builtin.live_grep, {}) -- ripgrep is required for live_grep to work here
      vim.keymap.set('n', '<C-h>', builtin.oldfiles, {})
      vim.keymap.set('n', '<C-b>', function()
        builtin.buffers({
          sort_mru = true,  -- Sort by most recently used
          ignore_current_buffer = true,  -- Optional: don't show current buffer in list
        })
      end, {})

      vim.keymap.set('n', '<leader>dd', builtin.diagnostics, { desc = "[D]ocument [D]iagnostics" })

      -- Visual mode mapping to search selected text
      vim.keymap.set('v', '<C-g>', function()
        -- Save the current register contents
        local original_register = vim.fn.getreg('"')
        -- Yank the selected text
        vim.cmd('normal! y')
        local text = vim.fn.getreg('"')
        -- Restore the original register contents
        vim.fn.setreg('"', original_register)
        -- Start live grep with the selected text
        builtin.live_grep({ default_text = text })
      end, { desc = "Live grep selected text" })
    end
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown { }
          }
        }
      })

      require("telescope").load_extension("ui-select")
    end
  }
}
