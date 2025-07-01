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
        source = "if_many",
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

    local vue_language_server_path = vim.fn.stdpath("data")
      .. "/mason/packages/vue-language-server/node_modules/@vue/language-server/node_modules/@vue/typescript-plugin"

    local tsdk_path = vim.fn.stdpath("data") .. "/mason/packages/typescript-language-server/node_modules/typescript/lib"

    local vue_plugin = {
      name = "@vue/typescript-plugin",
      location = vue_language_server_path,
      languages = { "vue", "javascript", "typescript" },
    }

    vim.lsp.config("ts_ls", {
      capabilities = capabilities,
      filetypes = {
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescriptreact",
        "typescript.tsx",
      },
      init_options = {
        plugins = {
          vue_plugin,
        },
      },
    })

    vim.lsp.config("vue_ls", {
      -- add filetypes for typescript, javascript and vue
      -- capabilities = capabilities,
      filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
      init_options = {
        typescript = {
          tsdk = tsdk_path,
        },
        vue = {
          -- disable hybrid mode
          hybridMode = false,
        },
      },
    })
  end,
}
