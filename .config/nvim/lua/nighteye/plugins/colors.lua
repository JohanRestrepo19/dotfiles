return {
  {
    "folke/tokyonight.nvim",
    lazy = true,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "night",
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
    lazy = true,
    priority = 1000,
    config = function()
      require("solarized-osaka").setup({
        transparent = true,
        styles = {
          sidebars = "dark",
          floats = "transparent"
        },
        on_highlights = function(hl, c)
          -- hl.LineNr = { fg = c.base01 }
          -- hl.CursorLine = { bg = c.base03 }
          -- hl.CursorLineNr = { fg = c.base2 }
        end,
      })
      vim.cmd.colorscheme("solarized-osaka")
    end,
  },
  {
    "ellisonleao/gruvbox.nvim",
    lazy = true,
    priority = 1000,
    config = function()
      require("gruvbox").setup({
        transparent_mode = true,
        contrast = "hard",
      })
      vim.o.background = "dark"
      vim.cmd.colorscheme("gruvbox")
    end,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = true,
    config = function()
      require("rose-pine").setup({
        styles = {
          bold = true,
          italic = true,
          transparency = true,
        },
      })

      vim.cmd("colorscheme rose-pine")
    end,
  },
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("nightfox").setup({
        options = {
          transparent = true,
          styles = {
            comments = "italic",
            conditionals = "italic",
            constants = "bold",
            functions = "italic,bold",
          },
        },
      })

      vim.cmd.colorscheme("terafox")
    end,
  },
}
