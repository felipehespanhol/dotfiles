-- Config with :Copilot setup
return {
  {
    "zbirenbaum/copilot.lua",
    dependencies = {
      { "copilotlsp-nvim/copilot-lsp" }, -- (optional) for NES functionality
    },
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = {
          enabled = true,
          auto_trigger = true,
          keymap = {
            accept = "<TAB>",
            accept_word = false,
            accept_line = false,
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
          },
        },
      })

      -- 2. Safely initialize the LSP bridge for NES functionality
      -- This is the part that was failing in your original config
      local status, copilot_lsp = pcall(require, "copilot_lsp")
      if status then
        copilot_lsp.setup({})
      end
    end,
  }
  -- {
  --   "CopilotC-Nvim/CopilotChat.nvim",
  --   branch = "main",
  --   dependencies = {
  --     { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
  --     { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
  --   },
  --   build = "make tiktoken", -- tiktoken for accurate token counting (only on MacOS or Linux)
  --   opts = {
  --     debug = true, -- Enable debugging
  --     -- model = "gpt-5.2",
  --     -- model = "gemini-3-flash-preview",
  --     model = "claude-sonnet-4.5",
  --     -- model = "claude-opus-4.5",
  --     temperature = 0.1, -- default 0.1
  --     auto_insert_mode = true,     -- Enter insert mode when opening
  --     window = {
  --       title = '🤖 AI Assistant',
  --     },
  --     headers = {
  --       user = '👤 You',
  --       assistant = '🤖 Copilot',
  --       tool = '🔧 Tool',
  --     },
  --   },
  --   keys = {
  --     { "<leader>co", "<cmd>CopilotChat<cr>", desc = "Chat with Copilot" },
  --   }
  -- },
}
