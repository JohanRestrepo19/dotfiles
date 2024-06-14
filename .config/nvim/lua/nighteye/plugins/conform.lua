return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
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
        markdown = { "prettier" },
      },
      format_on_save = function(bufnr)
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end

        return { lsp_fallback = true, timeout_ms = 500 }
      end,
    })

    vim.keymap.set("n", "<leader>fe", ":FormatEnable<cr>")
    vim.keymap.set("n", "<leader>fd", ":FormatDisable<cr>")
  end,
}
