return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  keys = {
    {
      -- Customize or remove this keymap to your liking
      "<leader>pf",
      function()
        require("conform").format({ async = true, lsp_format = "fallback" })
      end,
      mode = "",
      desc = "Format buffer",
    },
  },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "ruff_format" },
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        vue = { "prettier" },
        markdown = { "prettier" },
      },
      formatters = {
        prettier = {

          args = function(ctx)
            local args = { "--stdin-filepath", "$FILENAME" }

            local found_project_config = vim.fs.find({
              ".prettierrc",
              ".prettierrc.json",
              ".prettierrc.js",
              "prettier.config.js",
              "prettier.config.cjs",
            }, { upward = true, path = ctx.dirname })[1]

            if not found_project_config then
              vim.list_extend(args, {
                "--single-quote",
                "--no-semi",
                "--trailing-comma",
                "es5",
              })
            end

            return args
          end,
        },
      },
    })

    vim.api.nvim_create_user_command("Format", function(args)
      local range = nil
      if args.count ~= -1 then
        local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
        range = {
          start = { args.line1, 0 },
          ["end"] = { args.line2, end_line:len() },
        }
      end
      require("conform").format({ async = true, lsp_format = "fallback", range = range, timeout_ms = 500 })
    end, { range = true })
  end,
}
