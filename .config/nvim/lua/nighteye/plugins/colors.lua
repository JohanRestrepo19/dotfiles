---@diagnostic disable: undefined-doc-name, undefined-field, inject-field, undefined-doc-param

return {
    {
        dir = "~/Desktop/dev/lua-plugins/rose-pine",
        dev = true,
        lazy = true,
        priority = 1000,
        config = function()
            local rose_pine = require("rose-pine")
            rose_pine.setup({
                styles = {
                    comments = { italic = true },
                    keywords = { bold = false, italic = false },
                    functions = { bold = false, italic = true },
                    variables = {},

                    bold = true,
                    italic = true,
                    transparency = true,
                },

                highlight_groups = {
                    -- CursorLine = { bg = "none" },
                    StatusLine = { bg = "surface" },
                    Pmenu = { bg = "surface" },
                },
            })

            rose_pine.colorscheme()
        end,
    },
    {
        "folke/tokyonight.nvim",
        lazy = true,
        priority = 1000,
        config = function()
            require("tokyonight").setup({
                -- your configuration comes here
                -- or leave it empty to use the default settings
                style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
                light_style = "day", -- The theme is used when the background is set to light
                transparent = true, -- Enable this to disable setting the background color
                terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
                styles = {
                    -- Style to be applied to different syntax groups
                    -- Value is any valid attr-list value for `:help nvim_set_hl`
                    comments = { italic = true },
                    keywords = { bold = false, italic = false },
                    functions = { bold = true, italic = false },
                    variables = {},
                    -- Background styles. Can be "dark", "transparent" or "normal"
                    sidebars = "transparent", -- style for sidebars, see below
                    floats = "transparent", -- style for floating windows
                },
                sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
                day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
                hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
                dim_inactive = false, -- dims inactive windows
                lualine_bold = true, -- When `true`, section headers in the lualine theme will be bold

                --- You can override specific color groups to use other groups or a hex color
                --- function will be called with a ColorScheme table
                ---@param colors ColorScheme
                on_colors = function(_) end,

                --- You can override specific highlights to use other groups or a hex color
                --- function will be called with a Highlights and ColorScheme table
                ---@param highlights Highlights
                ---@param colors ColorScheme
                on_highlights = function(highlights, colors)
                    highlights.NormalFloat = { bg = colors.bg_dark }
                    highlights.WinSeparator = { fg = colors.fg }
                    highlights.DiagnosticVirtualTextError = { bg = colors.none, fg = colors.error }
                    highlights.DiagnosticVirtualTextWarn = { bg = colors.none, fg = colors.warning }
                    highlights.DiagnosticVirtualTextInfo = { bg = colors.none, fg = colors.info }
                    highlights.DiagnosticVirtualTextHint = { bg = colors.none, fg = colors.hint }
                    highlights.LineNr = { fg = colors.dark5 }
                    highlights.CursorLineNr = { fg = colors.orange }
                    highlights.CursorLine = { bg = colors.none }
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
                -- your configuration comes here
                -- or leave it empty to use the default settings
                transparent = true, -- Enable this to disable setting the background color
                terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
                styles = {
                    -- Style to be applied to different syntax groups
                    -- Value is any valid attr-list value for `:help nvim_set_hl`
                    comments = { italic = true },
                    keywords = { bold = false, italic = false },
                    functions = { bold = false, italic = true },
                    variables = {},

                    -- Background styles. Can be "dark", "transparent" or "normal"
                    sidebars = "transparent", -- style for sidebars, see below
                    floats = "transparent", -- style for floating windows
                },
                sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
                day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
                hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
                dim_inactive = false, -- dims inactive windows
                lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

                --- You can override specific color groups to use other groups or a hex color
                --- function will be called with a ColorScheme table
                ---@param colors ColorScheme
                on_colors = function(_) end,

                --- You can override specific highlights to use other groups or a hex color
                --- function will be called with a Highlights and ColorScheme table
                ---@param highlights Highlights
                ---@param colors ColorScheme
                on_highlights = function(_, _) end,
            })
            vim.cmd.colorscheme("solarized-osaka")
        end,
    },
    {
        "marko-cerovac/material.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("material").setup({
                contrast = {
                    terminal = false, -- Enable contrast for the built-in terminal
                    sidebars = false, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
                    floating_windows = false, -- Enable contrast for floating windows
                    cursor_line = false, -- Enable darker background for the cursor line
                    lsp_virtual_text = false, -- Enable contrasted background for lsp virtual text
                    non_current_windows = false, -- Enable contrasted background for non-current windows
                    filetypes = {}, -- Specify which filetypes get the contrasted (darker) background
                },

                styles = { -- Give comments style such as bold, italic, underline etc.
                    comments = { italic = true },
                    strings = {},
                    keywords = {},
                    functions = {},
                    variables = {},
                    operators = {},
                    types = { bold = true },
                },

                plugins = {
                    "fidget",
                    "gitsigns",
                    "harpoon",
                    "neo-tree",
                    "nvim-web-devicons",
                    "telescope",
                },

                disable = {
                    colored_cursor = false, -- Disable the colored cursor
                    borders = false, -- Disable borders between verticaly split windows
                    background = true, -- Prevent the theme from setting the background (NeoVim then uses your terminal background)
                    term_colors = false, -- Prevent the theme from setting terminal colors
                    eob_lines = false, -- Hide the end-of-buffer lines
                },

                custom_colors = nil, -- If you want to override the default colors, set this to a function

                custom_highlights = {}, -- Overwrite highlights with your own
            })

            vim.g.material_style = "deep ocean"
            vim.cmd.colorscheme("material")
        end,
    },
}
