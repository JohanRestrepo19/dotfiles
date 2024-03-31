return {
    "stevearc/conform.nvim",
    config = function()
        local conform = require("conform")

        conform.setup({
            formatters_by_ft = {
                lua = { "stylua" },
                python = { "ruff" },
                javascript = { "prettier" },
                javascriptreact = { "prettier" },
                typescript = { "prettier" },
                typescriptreact = { "prettier" },
            },
        })

        vim.keymap.set("n", "<leader>ff", function()
            conform.format({
                async = true,
                lsp_fallback = true,
            })
        end, { noremap = true, silent = true })
    end,
}
