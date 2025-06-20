return {
    "folke/todo-comments.nvim",
    event = "VimEnter",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local todo_comments = require("todo-comments")
        todo_comments.setup()
        vim.keymap.set("n", "<leader>tl", ":TodoTelescope initial_mode=normal<cr>", { noremap = true, silent = true })
    end,
}
