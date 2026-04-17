return {
  {
    "ThePrimeagen/refactoring.nvim",
    lazy = false,
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      -- { "nvim-treesitter/nvim-treesitter" },
    },
    keys = {
      { "<leader>rr", "<cmd>lua require('refactoring').select_refactor()<CR>", mode = "v", desc = "Select Refactor" },
      { "<leader>re", "<cmd>lua require('refactoring').refactor('Extract Function')<CR>", mode = "v", desc = "Extract Function" },
      { "<leader>rf", "<cmd>lua require('refactoring').refactor('Extract Function To File')<CR>", mode = "v", desc = "Extract Function To File" },
      { "<leader>rv", "<cmd>lua require('refactoring').refactor('Extract Variable')<CR>", mode = "v", desc = "Extract Variable" },
      { "<leader>ri", "<cmd>lua require('refactoring').refactor('Inline Variable')<CR>", mode = "v", desc = "Inline Variable" },
    },
  }
};
