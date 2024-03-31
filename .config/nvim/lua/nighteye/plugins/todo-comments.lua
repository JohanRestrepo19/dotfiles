return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local todo_comments = require("todo-comments")
        local opts = { noremap = true, silent = true }

        todo_comments.setup({})

        vim.keymap.set("n", "<leader>tl", ":TodoTelescope<cr>", opts)
    end,
}
