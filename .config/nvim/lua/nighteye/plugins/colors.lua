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
                theme = "dragon",
                background = { dark = "dragon" },
            })
            vim.cmd.colorscheme("kanagawa")
        end,
    },
    {
        "oxfist/night-owl.nvim",
        lazy = true, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            -- load the colorscheme here
            require("night-owl").setup({
                -- These are the default settings
                bold = false,
                italics = false,
                underline = true,
                undercurl = true,
                transparent_background = true,
            })
            vim.cmd.colorscheme("night-owl")
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
        lazy = false,
        priority = 1000,
        config = function()
            require("tokyonight").setup({
                style = "night",
                transparent = true,
                terminal_colors = true,
                styles = { sidebars = "transparent", floats = "transparent" },

                on_highlights = function(highlights, colors)
                    local prompt = "#2d3149"
                    highlights.WinSeparator = { fg = colors.cyan }
                    highlights.TelescopeNormal = {
                        bg = colors.bg_dark,
                        fg = colors.fg_dark,
                    }
                    highlights.TelescopeBorder = {
                        bg = colors.bg_dark,
                        fg = colors.bg_dark,
                    }
                    highlights.TelescopePromptNormal = {
                        bg = prompt,
                    }
                    highlights.TelescopePromptBorder = {
                        bg = prompt,
                        fg = prompt,
                    }
                    highlights.TelescopePromptTitle = {
                        bg = prompt,
                        fg = prompt,
                    }
                    highlights.TelescopePreviewTitle = {
                        bg = colors.bg_dark,
                        fg = colors.bg_dark,
                    }
                    highlights.TelescopeResultsTitle = {
                        bg = colors.bg_dark,
                        fg = colors.bg_dark,
                    }
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
            require("solarized-osaka").setup({ transparent = true })

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
        "EdenEast/nightfox.nvim",
        lazy = true,
        priority = 1000,
        config = function()
            require("nightfox").setup({
                options = {
                    transparent = true,
                    styles = { comments = "italic" },
                },
            })

            vim.cmd.colorscheme("nightfox")
        end,
    },
}
