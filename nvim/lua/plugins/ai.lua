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
            accept = false,
            accept_word = false,
            accept_line = false,
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
          },
        },
      })

      vim.keymap.set("i", "<Tab>", function()
        if require("copilot.suggestion").is_visible() then
          require("copilot.suggestion").accept()
        else
          vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, true, true), "n", false)
        end
      end, { desc = "Copilot Accept or Tab" })

      -- 2. Safely initialize the LSP bridge for NES functionality
      -- This is the part that was failing in your original config
      local status, copilot_lsp = pcall(require, "copilot_lsp")
      if status then
        copilot_lsp.setup({})
      end
    end,
  },
  {
    "olimorris/codecompanion.nvim",
    version = "^18.0.0",
    cmd = { "CodeCompanionChat", "CodeCompanionCmd", "CodeCompanionInline", "CodeCompanionActions" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      { "nvim-lua/plenary.nvim", branch = "master" },
      -- {
      --   "OXY2DEV/markview.nvim",
      --   lazy = false,
      --   opts = {
      --     preview = {
      --       filetypes = { "markdown", "codecompanion" },
      --       ignore_buftypes = {},
      --     },
      --   },
      -- },
      -- {
      --   "MeanderingProgrammer/render-markdown.nvim",
      --   ft = { "markdown", "codecompanion" }
      -- },
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
          adapter = "copilot",
        },
        inline = {
          adapter = "copilot",
        },
        cmd = {
          adapter = "copilot",
        },
        -- background = {
        --   adapter = {
        --     name = "gemini",
        --     model = "gemini-3.0-flash-preview",
        --   },
        -- },
      },
      extensions = {
        mcphub = {
          callback = "mcphub.extensions.codecompanion",
          opts = {
            -- MCP Tools
            make_tools = true,              -- Make individual tools (@server__tool) and server groups (@server) from MCP servers
            show_server_tools_in_chat = true, -- Show individual tools in chat completion (when make_tools=true)
            add_mcp_prefix_to_tool_names = false, -- Add mcp__ prefix (e.g `@mcp__github`, `@mcp__neovim__list_issues`)
            show_result_in_chat = true,      -- Show tool results directly in chat buffer
            format_tool = nil,               -- function(tool_name:string, tool: CodeCompanion.Agent.Tool) : string Function to format tool names to show in the chat buffer
            -- MCP Resources
            make_vars = true,                -- Convert MCP resources to #variables for prompts
            -- MCP Prompts
            make_slash_commands = true,      -- Add MCP prompts as /slash commands
          }
        }
      }
    },
    keys = {
      { "<leader>co", "<cmd>CodeCompanionChat Toggle<cr>", desc = "Chat with CodeCompanion", noremap = true, silent = true, mode = { "n", "v" } },
      { "<C-a>", "<cmd>CodeCompanionActions<cr>", noremap = true, silent = true, mode = { "n", "v" }, desc = "CodeCompanionActions" },
      { "ga", "<cmd>CodeCompanionChat Add<cr>", noremap = true, silent = true, mode = { "v" }, desc = "CodeCompanionChat Add" },
    },
  },
  {
    "ravitemer/mcphub.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    build = "pnpm install -g mcp-hub@latest",  -- Installs `mcp-hub` node binary globally
    config = function()
      require("mcphub").setup()
    end
  },
}
