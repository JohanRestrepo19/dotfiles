return {
  {
    "rebelot/kanagawa.nvim",
    lazy = true,
    priority = 1000,
    config = function()
      require("kanagawa").setup({
        compile = true,
        transparent = true,
        colors = { theme = { all = { ui = { bg_gutter = "none" } } } },
        overrides = function(colors)
          local theme = colors.theme
          return {
            NormalFloat = { bg = "none" },
            FloatBorder = { bg = "none" },
            FloatTitle = { bg = "none" },
            NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
            LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
            MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },

            Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
            PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
            PmenuSbar = { bg = theme.ui.bg_m1 },
            PmenuThumb = { bg = theme.ui.bg_p2 },

            -- CursorLine = { bg = "NONE" },
          }
        end,
        theme = "dragon",
        background = { dark = "dragon" },
      })
      vim.cmd.colorscheme("kanagawa")
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    lazy = true,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        transparent_background = true,
        integrations = {
          native_lsp = {
            underlines = {
              errors = { "undercurl" },
              hints = { "undercurl" },
              warnings = { "undercurl" },
              information = { "undercurl" },
              ok = { "undercurl" },
            },
          },
        },
      })
      vim.cmd.colorscheme("catppuccin")
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = true,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "night",
        transparent = true,
        terminal_colors = true,
        styles = { sidebars = "transparent", floats = "dark" },

        on_highlights = function(highlights, colors)
          highlights.WinSeparator = { fg = colors.cyan }
          highlights.CursorLine = { fg = colors.none }
        end,
      })

      vim.cmd.colorscheme("tokyonight-night")
    end,
  },
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("solarized-osaka").setup({
        transparent = true,
        on_highlights = function(highlights)
          highlights.CursorLine = { bg = highlights.none }
        end,
      })

      vim.cmd.colorscheme("solarized-osaka")
    end,
  },
  {
    "/rose-pine/neovim",
    name = "rose-pine",
    lazy = true,
    priority = 1000,
    config = function()
      require("rose-pine").setup({
        styles = { italic = false, transparency = true },
      })
      vim.cmd.colorscheme("rose-pine")
    end,
  },
  {
    "Mofiqul/dracula.nvim",
    priority = 1000,
    lazy = true,
    config = function()
      require("dracula").setup({
        transparent_bg = true
      })
      vim.cmd.colorscheme("dracula")
    end,
  },
}
