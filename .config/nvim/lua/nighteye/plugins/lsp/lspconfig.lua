return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        { "j-hui/fidget.nvim", tag = "v1.1.0" },
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
        -- NOTE: lspconfig related configs
        local lspconfig = require("lspconfig")
        require("fidget").setup({
            notification = {
                window = { winblend = 0 },
            },
        })

        -- Diagnostic symbols in the sign column (gutter)
        local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

        for type, icon in pairs(signs) do
            local hl_name = "DiagnosticSign" .. type
            vim.fn.sign_define(hl_name, {
                text = icon,
                texthl = hl_name,
                numhl = hl_name,
            })
        end

        -- Borders for hover menus
        local border = {
            { "╭", "FloatBorder" },
            { "─", "FloatBorder" },
            { "╮", "FloatBorder" },
            { "│", "FloatBorder" },
            { "╯", "FloatBorder" },
            { "─", "FloatBorder" },
            { "╰", "FloatBorder" },
            { "│", "FloatBorder" },
        }

        -- Override globally
        local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
        function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
            opts = opts or {}
            opts.border = opts.border or border
            return orig_util_open_floating_preview(contents, syntax, opts, ...)
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
        })

        local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

        -- NOTE: Mason related configs
        require("mason").setup({})
        require("mason-lspconfig").setup({
            ensure_installed = {
                "cssls",
                "html",
                "intelephense",
                "lua_ls",
                "prismals",
                "pyright",
                "tailwindcss",
                "tsserver",
                "eslint",
            },
            automatic_installation = true,
            handlers = {
                function(server_name) -- default handler (optional)
                    lspconfig[server_name].setup({
                        capabilities = capabilities,
                    })
                end,
                ["lua_ls"] = function()
                    lspconfig.lua_ls.setup({
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
            },
        })

        require("mason-tool-installer").setup({
            ensure_installed = {
                "prettier",
                "stylua",
            },
        })
    end,
}
