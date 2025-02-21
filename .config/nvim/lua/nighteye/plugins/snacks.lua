return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    indent = {
      enabled = false,
      char = "┊",
    },
    statuscolumn = { enabled = true },
    profiler = { enabled = true },
    util = { enabled = true },
  },

  config = function()
    local opts = { noremap = true, silent = true }
    vim.keymap.set("n", "<leader>il", function()
      local snacks = require("snacks")

      if snacks.indent.enabled == true then
        return snacks.indent.disable()
      end

      if snacks.indent.enabled == false then
        return snacks.indent.enable()
      end

    end, opts)
  end,
}
