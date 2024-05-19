return {
  {
    "max397574/colortils.nvim",
    cmd = "Colortils",
    config = function()
      require("colortils").setup()
    end,
  },
  {
    "brenoprata10/nvim-highlight-colors",
    config = function()
      vim.opt.termguicolors = true

      require("nvim-highlight-colors").setup {
        ---Render style
        ---@usage 'background'|'foreground'|'virtual'
        render = 'virtual',

        ---Highlight tailwind colors, e.g. 'bg-blue-500'
        enable_tailwind = true,
      }
    end
  }
}
