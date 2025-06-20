--- @param trunc_width number trunctates component when screen width is less then trunc_width
--- @param trunc_len number truncates component to trunc_len number of chars
--- @param hide_width number hides component when window width is smaller then hide_width
--- @param no_ellipsis boolean whether to disable adding '...' at end after truncation
--- return function that can format the component accordingly
local function trunc(trunc_width, trunc_len, hide_width, no_ellipsis)
    return function(str)
        local win_width = vim.fn.winwidth(0)
        if hide_width and win_width < hide_width then
            return ""
        elseif trunc_width and trunc_len and win_width < trunc_width and #str > trunc_len then
            return str:sub(1, trunc_len) .. (no_ellipsis and "" or "...")
        end
        return str
    end
end

local function path_option()
    local cols = vim.api.nvim_get_option_value("columns", {})
    if cols > 100 then
        return 1
    else
        return 0
    end
end

local function lualine_options()
    local lualine_require = require("lualine_require")
    lualine_require.require = require

    local icons = require("lazy-icons")
    local Snacks = require("snacks")

    vim.o.laststatus = vim.g.lualine_laststatus

    local opts = {
        options = {
            theme = "auto",
            globalstatus = vim.o.laststatus == 3,
            disabled_filetypes = { statusline = { "dashboard", "alpha", "ministarter", "snacks_dashboard" } },
            always_show_tabline = false,
        },
        tabline = {
            lualine_a = {
                { "tabs", mode = 1, max_length = 70 },
            },
        },
        sections = {
            lualine_a = { "mode" },
            lualine_b = { { "branch", fmt = trunc(104, 5, 50, false) } },
            lualine_c = {
                {
                    "diff",
                    symbols = {
                        added = icons.git.added,
                        modified = icons.git.modified,
                        removed = icons.git.removed,
                    },
                    source = function()
                        local gitsigns = vim.b.gitsigns_status_dict
                        if gitsigns then
                            return {
                                added = gitsigns.added,
                                modified = gitsigns.changed,
                                removed = gitsigns.removed,
                            }
                        end
                    end,
                },
                { "filetype", icon_only = false, separator = "", padding = { left = 1, right = 0 } },
                {
                    "filename",
                    path = path_option(),
                },
            },
            lualine_x = {
                Snacks.profiler.status(),
                {
                    require("lazy.status").updates,
                    cond = require("lazy.status").has_updates,
                    color = function()
                        return { fg = Snacks.util.color("Special") }
                    end,
                },
                {
                    "diagnostics",
                    symbols = {
                        error = icons.diagnostics.Error,
                        warn = icons.diagnostics.Warn,
                        info = icons.diagnostics.Info,
                        hint = icons.diagnostics.Hint,
                    },
                },
            },
            lualine_y = {
                { "progress", separator = " ", padding = { left = 1, right = 0 } },
                { "location", padding = { left = 0, right = 1 } },
            },
            lualine_z = {
                -- {'filetype'}
                function()
                    return " " .. os.date("%R")
                end,
            },
        },
        extensions = { "neo-tree", "lazy", "fzf" },
    }

    return opts
end

return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    enabled = true,
    config = function()
        require("lualine").setup(lualine_options())
    end,
}
