return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        "JoosepAlviste/nvim-ts-context-commentstring",
        "numToStr/Comment.nvim",
    },
    build = ":TSUpdate",
    config = function()
        local treesitter = require("nvim-treesitter.configs")
        local comment = require("Comment")
        local ts_comment_string = require("ts_context_commentstring")

        comment.setup({
            pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
        })

        ts_comment_string.setup({
            enable = true,
            enable_autocmd = false,
        })
        vim.g.skip_ts_context_commentstring_module = true

        treesitter.setup({
            highlight = {
                enable = true, -- false will disable the whole extension
                disable = {}, -- list of language that will be disabled
            },

            indent = {
                enable = true,
                disable = {},
            },

            ensure_installed = {
                "lua",
                "c",
                "css",
                "gitcommit",
                "html",
                "javascript",
                "json",
                "markdown",
                "markdown_inline",
                "php",
                "prisma",
                "python",
                "typescript",
                "tsx",
                "vim",
                "vimdoc",
                "yaml",
            },

            autotag = {
                enable = true,
            },

            ignore_install = { "" }, -- List of parsers to ignore installing
        })
    end,
}
