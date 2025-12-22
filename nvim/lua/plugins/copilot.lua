-- Config with :Copilot setup
return {
  {
    "zbirenbaum/copilot.lua"
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "main",
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    build = "make tiktoken", -- tiktoken for accurate token counting (only on MacOS or Linux)
    opts = {
      debug = true, -- Enable debugging
      -- model = "gpt-4",
      model = "gemini-3-flash-preview",
      temperature = 0.1, -- default 0.1
      auto_insert_mode = true,     -- Enter insert mode when opening
      window = {
        title = '🤖 AI Assistant',
      },
      headers = {
        user = '👤 You',
        assistant = '🤖 Copilot',
        tool = '🔧 Tool',
      },
    },
    keys = {
      { "<leader>co", "<cmd>CopilotChat<cr>", desc = "Chat with Copilot" },
    }
  },
  -- {
  --   "olimorris/codecompanion.nvim",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-treesitter/nvim-treesitter",
  --   },
  --   opts = {
  --     -- NOTE: The log_level is in `opts.opts`
  --     opts = {
  --       log_level = "DEBUG", -- or "TRACE"
  --     },
  --   },
  -- },
  -- {
  --   "3ZsForInsomnia/vs-code-companion",
  --   opts = {
  --     directories = {'.github/prompts', '.github/chatmodes'}, -- Where to find prompt files
  --   },
  -- },
}
