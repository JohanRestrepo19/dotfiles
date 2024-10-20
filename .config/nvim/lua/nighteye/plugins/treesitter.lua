return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local treesitter = require("nvim-treesitter.configs")

            treesitter.setup({
                highlight = { enable = true },
                indent = { enable = true },
                ensure_installed = {
                    "lua",
                    "c",
                    "css",
                    "dockerfile",
                    "gitcommit",
                    "html",
                    "http",
                    "javascript",
                    "json",
                    "markdown",
                    "markdown_inline",
                    "php",
                    "prisma",
                    "python",
                    "ruby",
                    "typescript",
                    "tsx",
                    "vim",
                    "vimdoc",
                    "xml",
                    "yaml",
                },
            })
        end,
    },
    {
        "numToStr/Comment.nvim",
        dependencies = {
            {
                "JoosepAlviste/nvim-ts-context-commentstring",
                opts = { enable_autocmd = false },
            },
        },
        config = function()
            require("Comment").setup({
                pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
            })
        end,
    },
}
