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
            require("tokyonight").setup({
                style = "night",
                light_style = "day",
                transparent = true,
                terminal_colors = true,
                styles = {
                    sidebars = "transparent",
                    floats = "transparent",
                },

                ---@param colors ColorScheme
                on_colors = function() end,

                ---@param highlights Highlights
                ---@param colors ColorScheme
                on_highlights = function(highlights, colors)
                    highlights.NormalFloat = { bg = colors.bg_dark }
                    highlights.WinSeparator = { fg = colors.fg }
                    highlights.CursorLine = { bg = colors.none }
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
                compile = true,
                transparent = true,
                colors = {
                    theme = {
                        all = { ui = { bg_gutter = "none" } },
                    },
                },
                theme = "dragon",
                background = { dark = "wave", light = "lotus" },

                overrides = function(colors)
                    local _ = colors.theme
                    return {
                        -- CursorLine = { bg = "none" },
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
                    colored_cursor = true,
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
    {
        "sainnhe/gruvbox-material",
        lazy = true,
        priority = 1000,
        config = function()
            vim.cmd([[
                    " Important!!
                    if has('termguicolors')
                    set termguicolors
                    endif

                    set background=dark

                    let g:gruvbox_material_background = 'hard'
                    let g:gruvbox_material_transparent_background = 1
                    let g:gruvbox_material_float_style = 'dim'
                    let g:gruvbox_material_diagnostic_virtual_text = 'colored'

                    " For better performance
                    let g:gruvbox_material_better_performance = 1
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
                contrast = "hard",
                transparent_mode = true,
                overrides = {
                    StatusLine = { bg = "#282828", fg = "#7c6f64" },
                    CursorLine = { bg = "none" },
                    CursorLineNr = { bg = "none" },
                },
            })

            vim.cmd.colorscheme("gruvbox")
        end,
    },
    {
        "craftzdog/solarized-osaka.nvim",
        priority = 1000,
        lazy = true,
        config = function()
            require("solarized-osaka").setup({})
            vim.cmd.colorscheme("solarized-osaka")
        end,
    },
}
