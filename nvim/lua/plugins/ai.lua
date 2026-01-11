return {
  -- Lazy.nvim
  {
    "olimorris/codecompanion.nvim",
    version = "^18.0.0",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      { "nvim-lua/plenary.nvim", branch = "master" },
      {
        "OXY2DEV/markview.nvim",
        lazy = false,
        opts = {
          preview = {
            filetypes = { "markdown", "codecompanion" },
            ignore_buftypes = {},
          },
        },
      },
      {
        "MeanderingProgrammer/render-markdown.nvim",
        ft = { "markdown", "codecompanion" }
      },
      {
        "HakonHarnes/img-clip.nvim",
        opts = {
          filetypes = {
            codecompanion = {
              prompt_for_file_name = false,
              template = "[Image]($FILE_PATH)",
              use_absolute_path = true,
            },
          },
        },
      },
    },
    opts = {
      adapters = {
        http = {
         gemini = function()
            return require("codecompanion.adapters").extend("gemini", {
              env = {
                -- set GEMINI_API_KEY env var
                -- or set api_key here
                -- api_key = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
              },
              schema = {
                model = {
                  default = "gemini-3-flash-preview",
                },
              },
            })
          end,
        }
      },
      interactions = {
        chat = {
          adapter = "gemini",
        },
        inline = {
          adapter = "gemini",
        },
        -- cmd = {
        --   adapter = "openai",
        -- },
        -- background = {
        --   adapter = {
        --     name = "gemini",
        --     model = "gemini-3.0-flash-preview",
        --   },
        -- },
      },
    },
    keys = {
      { "<leader>co", "<cmd>CodeCompanionChat<cr>", desc = "Chat with CodeCompanion" },
    }
  },
}
