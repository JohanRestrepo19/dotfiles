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

            StatusLine = { bg = theme.ui.bg_p1, fg = theme.ui.special },

            Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
            PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
            PmenuSbar = { bg = theme.ui.bg_m1 },
            PmenuThumb = { bg = theme.ui.bg_p2 },

            TelescopeTitle = { fg = theme.ui.special, bold = true },
            TelescopePromptNormal = { bg = theme.ui.bg_p1 },
            TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
            TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
            TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
            TelescopePreviewNormal = { bg = theme.ui.bg_dim },
            TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
          }
        end,
        theme = "wave",
        background = { dark = "wave" },
      })
      vim.cmd.colorscheme("kanagawa")
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = true,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "moon",
        transparent = true,
        terminal_colors = true,
        styles = { sidebars = "transparent", floats = "transparent" },

        on_highlights = function(highlights, colors)
          highlights.WinSeparator = { fg = colors.cyan }
        end,
      })

      vim.cmd.colorscheme("tokyonight")
    end,
  },
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("solarized-osaka").setup({ transparent = true })
      vim.cmd.colorscheme("solarized-osaka")
    end,
  },
}
