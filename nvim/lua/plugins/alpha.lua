return {
  'goolord/alpha-nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'nvim-lua/plenary.nvim'
  },
  config = function ()
    local status_ok, alpha = pcall(require, "alpha")
    if not status_ok then
      return
    end

    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.header.val = {
        [[                                                          ]],
        [[  ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗  ]],
        [[  ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║  ]],
        [[  ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║  ]],
        [[  ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║  ]],
        [[  ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║  ]],
        [[  ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝  ]],
        [[                                                          ]],
    }

     dashboard.section.buttons.val = {
       dashboard.button("<C-p>", "󰍉 Find file", ":Telescope find_files <CR>"),
       dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
       dashboard.button("<C-h>", "  Recently used files", ":Telescope oldfiles <CR>"),
       dashboard.button("<C-g>", "󰈞 Find text", ":Telescope live_grep <CR>"),
       dashboard.button("<C-n>", " Open folder", ":Neotree position=right <CR>:set relativenumber <CR>"),
       dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.lua<CR>"),
       dashboard.button("q", "󰿅 Quit Neovim", ":qa<CR>"),
    }

    local function footer()
      return {
        [[                                           ]],
        [[  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀     ]],
        [[  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⣿⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀     ]],
        [[  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⣿⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀     ]],
        [[  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣴⣶⣿⣿⣿⣿⣿⣷⣶⣶⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀     ]],
        [[  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣾⣿⣿⣿⣿⣿⣿⡿⢿⣿⣿⣿⣿⣿⣿⣷⣦⣄⠀⠀⠀⠀⠀⠀⠀     ]],
        [[  ⠀⠀⠀⠀⠀⠀⠀⣠⣴⣿⣿⠟⠋⠁⠀⣾⣿⣿⠁⠀⢿⣿⡄⠈⠙⠻⣿⣿⣿⣧⡀⠀⠀⠀⢀⡀     ]],
        [[  ⠀⠀⠀⠀⠀⢀⣾⣿⣿⠋⠀⠀⠀⠀⣼⣿⣿⠇⠀⠀⠘⣿⣷⠀⠀⠀⠀⠙⢿⣿⣿⣆⣴⡾⠋⠁     ]],
        [[  ⠀⠀⠀⠀⠠⣾⣿⡿⠁⠀⠀⠀⠀⣸⣿⣿⡟⠀⠀⠀⠀⠸⣿⣧⠀⠀⢀⣠⣼⣿⣿⣿⣇⠀⠀⠀     ]],
        [[  ⠀⠀⠀⠀⢰⣿⡿⠀⠀⠀⠀⠀⢠⣿⣿⣿⠁⠀⠀⠀⠀⠀⣻⣿⣶⣾⡿⠟⠋⠁⢻⣿⣿⡇⠀⠀     ]],
        [[  ⠀⠀⠀⠀⠀⣿⠃⠀⠀⠀⠀⠀⣾⣿⣿⠇⠀⢀⣀⣤⣶⣿⣿⣿⣿⡁⠀⠀⠀⠀⠀⣿⣿⣿⠀⠀     ]],
        [[  ⠀⠀⠀⠀⠀⠿⠀⠀⠀⠀⠀⣸⣿⣿⣿⣤⣾⣿⣿⣿⠟⠋⠀⠘⣿⣷⠀⠀⠀⠀⠀⢸⣿⣿⠀⠀     ]],
        [[  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣰⣿⣿⣿⣿⣿⡿⠟⠋⠀⠀⠀⠀⠀⠸⣿⣆⠀⠀⠀⠀⢸⣿⣿⠀⠀     ]],
        [[  ⠀⠀⠀⠀⠆⠀⣀⣤⣾⣿⣿⣿⣿⠟⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣿⡀⠀⠀⠀⣼⣿⡟⠀⠀     ]],
        [[  ⠀⠀⢀⣠⣴⣾⣿⣿⡿⢿⣿⣿⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣇⠀⠀⢰⣿⣿⠁⠀⠀     ]],
        [[  ⠀⢠⣿⣿⠿⠻⣏⠀⠀⣼⣿⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⡄⣠⣿⣿⠃⠀⠀⠀     ]],
        [[  ⠐⠋⠉⠀⠀⠀⠘⢷⣼⣿⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢈⣿⣿⣟⠁⠀⠀⠀⠀     ]],
        [[  ⠀⠀⠀⠀⠀⠀⠀⣰⣿⣿⣧⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣾⣿⠟⢯⠀⠀⠀⠀⠀⠀     ]],
        [[  ⠀⠀⠀⠀⠀⠀⠀⣸⣿⡇⠀⠙⠿⣶⣦⣤⣤⣤⣤⣤⣤⣤⣶⣾⣿⠿⠛⠁⠀⠘⢧⠀⠀⠀⠀⠀     ]],
        [[  ⠀⠀⠀⠀⠀⠀⠀⢸⡿⠀⠀⠀⠀⠀⠈⠙⠛⠛⠛⠛⠛⠋⠉⠉⠀⠀⠀⠀⠀⠀⠘⠀⠀⠀⠀⠀     ]],
        [[  ⠀⠀⠀⠀⠀⠀⠀⠻⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀     ]],
        [[  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀     ]],
        [[  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀     ]],
        [[                                           ]],
        [[     Don't Stop Until You Are Proud...     ]],
        [[                                           ]],
      }
    end

    dashboard.section.footer.val = footer()

    dashboard.section.footer.opts.hl = "Type"
    dashboard.section.header.opts.hl = "Include"
    dashboard.section.buttons.opts.hl = "Keyword"

    dashboard.opts.opts.noautocmd = true
    alpha.setup(dashboard.opts)
  end
};
