return {
    "lewis6991/gitsigns.nvim",
    config = function()
        require("gitsigns").setup({
            signs = {
                add = { text = "│" },
                change = { text = "│" },
                delete = { text = "󰍵" },
                topdelete = { text = "‾" },
                changedelete = { text = "~" },
                untracked = { text = "│" },
            },
            preview_config = { border = "rounded" },
            on_attach = function(_)
                local gs = require("gitsigns")
                vim.keymap.set("n", "<leader>dt", gs.diffthis)
                vim.keymap.set("n", "<leader>bl", gs.blame_line)
            end,
        })
    end,
}
