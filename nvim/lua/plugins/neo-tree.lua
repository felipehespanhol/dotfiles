return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  cmd = { "Neotree" },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  keys = {
    { "<C-n>", "<cmd>Neotree right reveal<CR>", desc = "Neo-Tree Toggle" },
  },
  opts = {
    event_handlers = {
      {
        event = "neo_tree_buffer_enter",
        handler = function()
          vim.opt_local.number = true
          vim.opt_local.relativenumber = true
        end,
      },
    },
    window = {
      width = 60,
      mappings = {
        ["<C-n>"] = "close_window",
        -- Go to root
        ["gr"] = function(state)
          require("neo-tree.ui.renderer").focus_node(state, state.tree:get_nodes()[1]:get_id())
        end,
        -- Go to parent
        ["gf"] = function(state)
          local node = state.tree:get_node()
          if node then
            local parent_id = node:get_parent_id()
            if parent_id then
              require("neo-tree.ui.renderer").focus_node(state, parent_id)
            end
          end
        end,
        ["+"] = function()
          vim.cmd("vertical resize +10")
        end,
        ["-"] = function()
          vim.cmd("vertical resize -10")
        end,
      },
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
}
