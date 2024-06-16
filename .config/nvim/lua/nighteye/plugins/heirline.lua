return {
  "rebelot/heirline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false,
  config = function()
    local heirline = require("heirline")
    local utils = require("heirline.utils")
    local StatusLine = require("nighteye.plugins.heirline-components.statusline")

    local function setup_colors()
      return {
        cyan = utils.get_highlight("Special").fg,
        orange = utils.get_highlight("Constant").fg,
      }
    end

    heirline.load_colors(setup_colors)

    heirline.setup({
      statusline = { StatusLine },
    })

    vim.api.nvim_create_augroup("Heirline", { clear = true })
    vim.api.nvim_create_autocmd("ColorScheme", {
      callback = function()
        utils.on_colorscheme(setup_colors)
      end,
      group = "Heirline",
    })
  end,
}
