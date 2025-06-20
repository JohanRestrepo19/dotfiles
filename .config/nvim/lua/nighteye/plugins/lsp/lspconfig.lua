return {
    "neovim/nvim-lspconfig",
    dependencies = { "hrsh7th/cmp-nvim-lsp" },
    config = function()
        local icons = require("lazy-icons")

        local signs = { text = {}, numhl = {} }

        for type, icon in pairs(icons.diagnostics) do
            local severity = vim.diagnostic.severity[string.upper(type)]
            signs["text"][severity] = icon
            signs["numhl"][severity] = ""
        end

        -- Diagnostic config.
        vim.diagnostic.config({
            virtual_text = { prefix = "󰮄 " },
            update_in_insert = false,
            float = {
                border = "rounded",
                header = "Diagnostics",
                prefix = "󱞩 ",
                source = "always",
                style = "minimal",
            },
            signs = signs,
        })

        local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

        -- NOTE: Add capabilities to all clients
        vim.lsp.config("*", { capabilities = capabilities })

        vim.lsp.config("lua_ls", {
            capabilities = capabilities,
            settings = {
                Lua = {
                    diagnostics = {
                        -- Get the language server to recognize the 'vim' global
                        globals = { "vim" },
                    },
                },
                workspace = {
                    -- Make the server aware of Neovim runtime files
                    library = vim.api.nvim_get_runtime_file("", true),
                },
            },
        })
    end,
}
