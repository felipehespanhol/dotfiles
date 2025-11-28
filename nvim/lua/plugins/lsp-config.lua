return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local cmp_nvim_lsp = require("cmp_nvim_lsp")
      local capabilities = vim.tbl_deep_extend(
        "force",
        {},
        vim.lsp.protocol.make_client_capabilities(),
        cmp_nvim_lsp.default_capabilities()
      )

      vim.lsp.config('tailwindcss', {
        capabilities = capabilities
      })
      vim.lsp.config('rubocop', {
        capabilities = capabilities
      })
      vim.lsp.config('ruby_lsp', {
        capabilities = capabilities,
        -- cmd = { vim.fn.system({"which", "ruby-lsp"}) }
        cmd = { "/home/felipe/.local/share/mise/installs/ruby/3.4.5/bin/ruby-lsp" }
      })
      vim.lsp.config('lua_ls', {
        capabilities = capabilities
      })

      -- TypeScript/JavaScript language features
      vim.lsp.config('tl_ls', {
        capabilities = capabilities,
      })

      -- ESLint diagnostics and code actions
      vim.lsp.config('eslint', {
        capabilities = capabilities,
        settings = {
          workingDirectory = { mode = "auto" },
          format = { enable = true }, -- let ESLint provide fixes via code actions
          codeAction = {
            disableRuleComment = { enable = true },
            showDocumentation = { enable = true },
          },
          nodePath = "node_modules",
          packageManager = "npm",
        },
      })

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
      vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, {})

      vim.keymap.set('n', 'gl', vim.diagnostic.open_float, { desc = "Show diagnostic [L]ine message" })
      vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
      vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })
    end,
  },
}
