return {
  "rebelot/heirline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  enabled = false,
  config = function()
    local heirline = require("heirline")
    local utils = require("heirline.utils")
    local StatusLine = require("nighteye.plugins.heirline-components.statusline")
    local customUtils = require("nighteye.plugins.heirline-components.utils")

    local theme = customUtils.load_theme(vim.g.colors_name)
    local mode_hls = customUtils.mode_highlights(theme)
    local base_colors = {
      cyan = utils.get_highlight("Special").fg,
      orange = utils.get_highlight("Constant").fg,
      error = utils.get_highlight("ErrorMsg").fg,
      warn = utils.get_highlight("WarningMsg").fg,
    }

    local colors = vim.tbl_deep_extend("force", base_colors, mode_hls)

    local function setup_colors()
      return colors
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
