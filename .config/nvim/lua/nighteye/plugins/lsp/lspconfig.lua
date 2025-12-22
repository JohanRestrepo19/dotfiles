return {

  "neovim/nvim-lspconfig",
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
        source = true,
        style = "minimal",
      },
      signs = signs,
    })

    -- NOTE: Add capabilities to all clients
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    vim.lsp.config("*", {
      capabilities = capabilities,
    })

    vim.lsp.config("lua_ls", {
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

    -- NOTE: Vue related config.

    -- local vue_language_server_path = vim.fn.stdpath("data")
    --   .. "/mason/packages/vue-language-server/node_modules/@vue/language-server/node_modules/@vue/typescript-plugin"

    local vue_language_server_path = vim.fn.stdpath("data")
      .. "/mason/packages/vue-language-server/node_modules/@vue/language-server"

    local tsserver_filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" }

    local vue_plugin = {
      name = "@vue/typescript-plugin",
      location = vue_language_server_path,
      languages = { "vue" },
      configNamespace = "typescript",
    }

    -- local vtsls_config = {
    --   settings = {
    --     vtsls = {
    --       tsserver = {
    --         globalPlugins = {
    --           vue_plugin,
    --         },
    --       },
    --     },
    --   },
    --   filetypes = tsserver_filetypes,
    -- }
    --
    local ts_ls_config = {
      init_options = {
        plugins = {
          vue_plugin,
        },
      },
      filetypes = tsserver_filetypes,
    }

    -- If you are on most recent `nvim-lspconfig`
    local vue_ls_config = {}
    -- vim.lsp.config("vtsls", vtsls_config)
    vim.lsp.config("vue_ls", vue_ls_config)
    vim.lsp.config("ts_ls", ts_ls_config)
    vim.lsp.enable({ "ts_ls", "vue_ls" })
  end,
}
