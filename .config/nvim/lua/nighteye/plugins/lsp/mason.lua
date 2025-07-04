return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    -- NOTE: Mason related configs
    require("mason").setup({
      ui = { border = "rounded" },
    })

    require("mason-lspconfig").setup({
      ensure_installed = {
        "cssls",
        "dockerls",
        "eslint",
        "html",
        "lua_ls",
        "marksman",
        "pyright",
        "ts_ls",
        "vue_ls",
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
