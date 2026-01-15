 return {
   -- {
   --   "ellisonleao/gruvbox.nvim",
   --   priority = 1000,
   --   opts = ...,
   --   config = function()
   --     vim.o.background = "dark"
   --     -- vim.o.background = "light"
   --     vim.cmd([[colorscheme gruvbox]])
   --   end
   -- },
   -- {
   --   "Mofiqul/vscode.nvim",
   --   priority = 1000,
   --   opts = ...,
   --   config = function()
   --     vim.o.background = "dark"
   --     vim.cmd.colorscheme "vscode"
   --   end
   -- },
   {
     "Mofiqul/adwaita.nvim",
     lazy = false,
     priority = 1000,

     -- configure and set on startup
     config = function()
       -- Light
       -- vim.o.background = "light"
       -- vim.g.adwaita_darker = false             -- for darker version
       -- vim.g.adwaita_transparent = true        -- makes the background transparent

       -- Dark
       -- vim.o.background = "dark"
       -- vim.g.adwaita_darker = true             -- for darker version
       -- vim.g.adwaita_transparent = false        -- makes the background transparent

       vim.g.adwaita_disable_cursorline = true -- to disable cursorline
       vim.cmd.colorscheme "adwaita"
     end
   }
}
