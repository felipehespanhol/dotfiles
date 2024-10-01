return {
  "ellisonleao/gruvbox.nvim",
  priority = 1000,
  opts = ...,
  config = function()
    -- vim.o.background = "dark"
    -- vim.o.background = "light"
    vim.cmd([[colorscheme gruvbox]])
  end
}
