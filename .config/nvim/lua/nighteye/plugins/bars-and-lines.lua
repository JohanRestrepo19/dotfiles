return {
    {
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = "nvim-tree/nvim-web-devicons",
        opts = {
            options = {
                mode = "tabs",
                separator_style = "thin",
                always_show_bufferline = false,
                show_buffer_close_icons = false,
                show_close_icon = false,
                color_icons = true,
            },
        },
    },
    {
        "rebelot/heirline.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        enabled = false,
        config = function()
            local heirline = require("heirline")
            local utils = require("heirline.utils")
            local StatusLine = require("nighteye.plugins.heirline-components.statusline")
            local customUtils = require("nighteye.plugins.heirline-components.utils")

            local theme = customUtils.load_theme(vim.g.colors_name)
            local mode_hls = customUtils.mode_highlights(theme)
            local base_colors = {
                cyan = utils.get_highlight("Special").fg,
                orange = utils.get_highlight("Constant").fg,
                error = utils.get_highlight("ErrorMsg").fg,
                warn = utils.get_highlight("WarningMsg").fg,
            }

            local colors = vim.tbl_deep_extend("force", base_colors, mode_hls)

            local function setup_colors()
                return colors
            end

            heirline.load_colors(setup_colors)
            heirline.setup({
                statusline = { StatusLine },
            })

            vim.api.nvim_create_augroup("Heirline", { clear = true })
            vim.api.nvim_create_autocmd("ColorScheme", {
                callback = function()
                    utils.on_colorscheme(setup_colors)
                end,
                group = "Heirline",
            })
        end,
    },
    {
        "echasnovski/mini.nvim",
        version = false,
        enabled = true,
        config = function()
            require('mini.statusline').setup()
        end
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {
            enabled = false,
            indent = { char = "┊" },
        },
    },
}
