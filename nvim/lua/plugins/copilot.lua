-- Config with :Copilot setup
return {
  {
    "github/copilot.vim"
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "main",
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
      debug = true, -- Enable debugging
      model = "gpt-5",
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
    },
    -- See Commands section for default commands if you want to lazy load on them
  },
}
