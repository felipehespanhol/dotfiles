return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },

  config = function()
    require("neo-tree").setup({
      window = {
        width = 60,
        mappings = {
          ["<C-n>"] = "close_window",
        },
        filesystem = {
          hijack_netrw_behavior = "open_default",  -- Prevents changing the working directory
          use_default_mappings = false,            -- Disable default mappings that might affect pwd
          bind_to_cwd = false,                     -- Don't bind the tree to the current directory
          follow_current_file = {
            enabled = true,                        -- Still follow the current file
            leave_dirs_open = false,               -- Don't leave directories open when following
          },
        }
      }
    })

    -- Toggle NeoTree with Ctrl+n
    vim.keymap.set('n', '<C-n>', function()
      local manager = require("neo-tree.sources.manager")
      local renderer = require("neo-tree.ui.renderer")

      local state = manager.get_state("filesystem")
      local window_exists = renderer.window_exists(state)

      if window_exists then
        vim.cmd("Neotree close")
      else
        vim.cmd("Neotree position=right reveal_file=%:p")
        vim.cmd("set relativenumber")
      end
    end, {})
  end
}
