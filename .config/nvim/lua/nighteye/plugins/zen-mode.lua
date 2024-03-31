return {
    "folke/zen-mode.nvim",
    keys = {
        { "<leader>zz", ":ZenMode<cr>", silent = true, mode = "n" },
    },
    config = function()
        local zenmode = require("zen-mode")
        zenmode.setup({
            window = {
                width = 0.60,
            },
        })

        -- vim.keymap.set("n", "<leader>zz", zenmode.toggle)
    end,
}
