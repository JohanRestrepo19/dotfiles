---@diagnostic disable: undefined-doc-name, undefined-field, inject-field, undefined-doc-param

return {
    {
        "rose-pine/neovim",
        as = "rose-pine",
        dir = "~/Desktop/dev/lua-plugins/rose-pine",
        dev = false,
        lazy = true,
        priority = 1000,
        config = function()
            local rose_pine = require("rose-pine")
            rose_pine.setup({
                styles = {
                    -- comments = { italic = true },
                    -- keywords = { bold = false, italic = false },
                    -- functions = { bold = true, italic = false },
                    -- variables = {},

                    -- bold = false,
                    -- italic = false,
                    transparency = true,
                },

                highlight_groups = {
                    CursorLine = { bg = "none" },
                    StatusLine = { bg = "surface" },
                    Pmenu = { bg = "surface" },
                },
            })

            rose_pine.colorscheme()
        end,
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            local bg = "#011628"
            local bg_dark = "#011423"
            local bg_highlight = "#143652"
            local bg_search = "#0A64AC"
            local bg_visual = "#275378"
            local fg = "#CBE0F0"
            local fg_dark = "#B4D0E9"
            local fg_gutter = "#627E97"
            local border = "#547998"

            require("tokyonight").setup({
                style = "night",
                light_style = "day",
                transparent = true,
                terminal_colors = true,
                styles = {
                    comments = { italic = true },
                    keywords = { bold = false, italic = false },
                    functions = { bold = true, italic = false },
                    variables = {},
                    sidebars = "transparent",
                    floats = "transparent",
                },

                ---@param colors ColorScheme
                on_colors = function(colors)
                    colors.bg = bg
                    colors.bg_dark = bg_dark
                    colors.bg_float = bg_dark
                    colors.bg_highlight = bg_highlight
                    colors.bg_popup = bg_dark
                    colors.bg_search = bg_search
                    colors.bg_sidebar = bg_dark
                    colors.bg_statusline = bg_dark
                    colors.bg_visual = bg_visual
                    colors.border = border
                    colors.fg = fg
                    colors.fg_dark = fg_dark
                    colors.fg_float = fg
                    colors.fg_gutter = fg_gutter
                    colors.fg_sidebar = fg_dark
                end,

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
                    -- highlights.CursorLine = { bg = colors.none }
                end,
            })

            vim.cmd.colorscheme("tokyonight")
        end,
    },
    {
        "rebelot/kanagawa.nvim",
        lazy = true,
        priority = 1000,
        config = function()
            require("kanagawa").setup({
                compile = false,
                transparent = true,
                colors = {
                    theme = {
                        all = { ui = { bg_gutter = "none" } },
                    },
                },
                theme = "wave",
                background = { dark = "wave", light = "lotus" },

                overrides = function(colors)
                    local _ = colors.theme
                    return {
                        CursorLine = { bg = "none" },
                        NormalFloat = { bg = "none" },
                        FloatBorder = { bg = "none" },
                        FloatTitle = { bg = "none" },
                    }
                end,
            })

            vim.cmd.colorscheme("kanagawa-dragon")
        end,
    },
    {
        "marko-cerovac/material.nvim",
        lazy = true,
        priority = 1000,
        config = function()
            require("material").setup({
                contrast = {
                    terminal = false,
                    sidebars = false,
                    floating_windows = false,
                    cursor_line = false,
                    lsp_virtual_text = false,
                    non_current_windows = false,
                    filetypes = {},
                },

                styles = {
                    comments = { italic = true },
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
                    colored_cursor = false,
                    borders = false,
                    background = true,
                    term_colors = false,
                    eob_lines = false,
                },

                custom_colors = nil,

                custom_highlights = {},
            })

            vim.g.material_style = "deep ocean"
            vim.cmd.colorscheme("material")
        end,
    },
}
