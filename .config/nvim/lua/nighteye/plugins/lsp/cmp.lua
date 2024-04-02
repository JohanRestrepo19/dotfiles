return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lua",
        {
            "L3MON4D3/LuaSnip",
            -- follow latest release.
            version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
            -- install jsregexp (optional!).
            build = "make install_jsregexp",
        },
        "rafamadriz/friendly-snippets",
        "onsails/lspkind.nvim",
    },
    event = "InsertEnter",
    config = function()
        local cmp = require("cmp")
        local lspkind = require("lspkind")
        local luasnip = require("luasnip")

        -- Load default snippets
        require("luasnip/loaders/from_vscode").lazy_load()

        cmp.setup({
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body) -- For `luasnip` users.
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-k>"] = cmp.mapping.select_prev_item(),
                ["<C-j>"] = cmp.mapping.select_next_item(),
                ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
                ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
                ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
                ["<C-e>"] = cmp.mapping({
                    i = cmp.mapping.abort(),
                    c = cmp.mapping.close(),
                }),
                -- Accept currently selected item. If none selected, `select` first item.
                -- Set `select` to `false` to only confirm explicitly selected items.
                ["<CR>"] = cmp.mapping.confirm({
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = true,
                }),
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp", max_item_count = 200 },
                { name = "nvim_lua" },
                { name = "luasnip" },
                { name = "buffer" },
                { name = "path" },
            }),
            formatting = {
                fields = { "abbr", "kind", "menu" },
                format = lspkind.cmp_format({
                    mode = "symbol_text",
                    maxwidth = 50,
                    ellipsis_char = "...",
                    show_labelDetails = true,
                    menu = {
                        nvim_lsp = "[lsp]",
                        nvim_lua = "[api]",
                        buffer = "[buf]",
                        path = "[path]",
                        luasnip = "[snip]",
                        gh_issues = "[issues]",
                    },
                }),
            },
            confirm_opts = {
                behavior = cmp.ConfirmBehavior.Replace,
                select = false,
            },
            experimental = {
                ghost_text = false,
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
        })
    end,
}
