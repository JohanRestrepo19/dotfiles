return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  config = function()
    local Snacks = require("snacks")
    local opts = { noremap = true, silent = true }

    Snacks.setup({
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      indent = {
        enabled = false,
        scope = { char = "┊" },
      },
      statuscolumn = { enabled = true },
      profiler = { enabled = true },
      util = { enabled = true },
    })

    vim.keymap.set("n", "<leader>il", function()
      if Snacks.indent.enabled == true then
        return Snacks.indent.disable()
      end

      if Snacks.indent.enabled == false then
        return Snacks.indent.enable()
      end
    end, opts)
  end,
}
