return {
  {
    "sainnhe/everforest",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.everforest_enable_italic = true
      vim.g.everforest_background = "hard"
      vim.g.everforest_transparent_background = 2
      vim.g.everforest_float_style = 'dim'
      vim.cmd.colorscheme("everforest")
    end
  },
  {
    "vague2k/vague.nvim",
    lazy = true,
    priority = 1000,
    config = function()
      require("vague").setup({
        transparent = true,
      })
      vim.cmd.colorscheme("vague")
    end,
  },
  {
    "AlexvZyl/nordic.nvim",
    lazy = true,
    priority = 1000,
    config = function()
      local nordic = require("nordic")

      nordic.setup({
        transparent = {
          -- Enable transparent background.
          bg = true,
          -- Enable transparent background for floating windows.
          float = false,
        },
      })

      nordic.load()
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
        styles = { sidebars = "transparent", floats = "dark" },

        on_highlights = function(highlights, colors)
          highlights.WinSeparator = { fg = colors.cyan }
          -- highlights.CursorLine = { fg = colors.none }
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
          floats = "dark",
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
    "sainnhe/gruvbox-material",
    lazy = true,
    config = function()
      vim.cmd([[
        let g:gruvbox_material_background = 'hard'
        let g:gruvbox_material_better_performance = 1
        let g:gruvbox_material_transparent_background = 2

        let g:gruvbox_material_diagnostic_virtual_text = 'colored'
      ]])
      vim.cmd.colorscheme("gruvbox-material")
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
        italic = {
          strings = false,
          emphasis = false,
          comments = false,
          operators = false,
          folds = false,
        },
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
        variant = "main",
        styles = {
          bold = false,
          italic = false,
          transparency = true,
        },
      })

      vim.cmd("colorscheme rose-pine")
    end,
  },
  {
    "EdenEast/nightfox.nvim",
    lazy = true,
    priority = 1000,
    config = function()
      require("nightfox").setup({
        options = {
          transparent = true,
          styles = {
            comments = "italic",
            conditionals = "italic",
            constants = "bold",
            functions = "bold",
          },
        },
      })

      vim.cmd.colorscheme("carbonfox")
    end,
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = true,
    priority = 1000,
    config = function()
      require("kanagawa").setup({
        compile = true, -- enable compiling the colorscheme
        undercurl = true, -- enable undercurls
        commentStyle = { italic = false },
        functionStyle = {},
        keywordStyle = { italic = false },
        statementStyle = { bold = false },
        typeStyle = {},
        transparent = true, -- do not set background color
        dimInactive = false, -- dim inactive window `:h hl-NormalNC`
        terminalColors = true, -- define vim.g.terminal_color_{0,17}
        colors = { -- add/modify theme and palette colors
          palette = {},
          theme = { wave = {}, lotus = {}, dragon = {}, all = {
            ui = { bg_gutter = "none" },
          } },
        },
        overrides = function(colors) -- add/modify highlights
          local theme = colors.theme
          local makeDiagnosticColor = function(color)
            local c = require("kanagawa.lib.color")
            return { fg = color, bg = c(color):blend(theme.ui.bg, 0.95):to_hex() }
          end

          return {

            NormalFloat = { bg = "none" },
            FloatBorder = { bg = "none" },
            FloatTitle = { bg = "none" },
            TelescopeBorder = { fg = "none" },

            -- Save an hlgroup with dark background and dimmed foreground
            -- so that you can use it where your still want darker windows.
            -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
            NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

            -- Popular plugins that open floats will link to NormalFloat by default;
            -- set their background accordingly if you wish to keep them dark and borderless
            LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
            MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },

            -- CursorLine = { bg = "none" },

            DiagnosticVirtualTextHint = makeDiagnosticColor(theme.diag.hint),
            DiagnosticVirtualTextInfo = makeDiagnosticColor(theme.diag.info),
            DiagnosticVirtualTextWarn = makeDiagnosticColor(theme.diag.warning),
            DiagnosticVirtualTextError = makeDiagnosticColor(theme.diag.error),
          }
        end,
        theme = "wave", -- Load "wave" theme when 'background' option is not set
        background = { -- map the value of 'background' option to a theme
          dark = "wave", -- try "dragon" !
          light = "lotus",
        },
      })

      -- setup must be called before loading
      vim.cmd("colorscheme kanagawa")
    end,
  },
}
