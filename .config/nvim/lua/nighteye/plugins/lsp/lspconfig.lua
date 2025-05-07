return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "j-hui/fidget.nvim", tag = "v1.1.0" },
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    "lspsaga",
  },
  config = function()
    local icons = require("lazy-icons")

    -- NOTE: lspconfig related configs
    local lspconfig = require("lspconfig")
    require("fidget").setup({
      notification = {
        window = { winblend = 0 },
      },
    })

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

    -- NOTE: Mason related configs
    require("mason").setup({
      ui = { border = "rounded" },
    })

    require("mason-lspconfig").setup({
      ensure_installed = {
        "cssls",
        "dockerls",
        "html",
        "lua_ls",
        "pyright",
        "ts_ls",
        "eslint",
      },
      automatic_installation = false,
    })

    require("mason-tool-installer").setup({
      ensure_installed = {
        "prettier",
        "stylua",
        "ruff",
      },
    })
  end,
}
