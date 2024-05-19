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
    vim.keymap.set('n', '<C-n>', ':Neotree position=right dir=%:p:h:h reveal_file=%:p<CR>:set relativenumber<CR>', {})

    require("neo-tree").setup({
      window = {
        mappings = {
          -- ["o"] = "open"
        }
      }
    })
  end
}
