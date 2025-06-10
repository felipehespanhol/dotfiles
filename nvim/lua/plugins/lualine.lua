return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup({
      options = {
        theme = 'gruvbox_dark'
      },
      tabline = {
        lualine_a = {
          {
            'tabs',
            tab_max_length = 40,  -- Maximum width of each tab. The content will be shorten dynamically (example: apple/orange -> a/orange)
            max_length = vim.o.columns, -- Maximum width of tabs component.
                                            -- Note:
                                            -- It can also be a function that returns
                                            -- the value of `max_length` dynamically.
            mode = 2, -- 0: Shows tab_nr
                      -- 1: Shows tab_name
                      -- 2: Shows tab_nr + tab_name

            path = 0, -- 0: just shows the filename
                      -- 1: shows the relative path and shorten $HOME to ~
                      -- 2: shows the full path
                      -- 3: shows the full path and shorten $HOME to ~

            -- Automatically updates active tab color to match color of other components (will be overidden if buffers_color is set)
            use_mode_colors = false,
          }
        },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
      },
      sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {
          {
            'filename',
            path = 3,  -- 2: shows the full path with tilde
          }
        },
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
      }
    })
  end
}
