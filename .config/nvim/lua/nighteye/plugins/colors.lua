return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("tokyonight").setup({
      style = "night",
      transparent = true,
      terminal_colors = true,
      styles = { sidebars = "dark", floats = "dark" },

      on_highlights = function(highlights, colors)
        highlights.NormalFloat = { bg = colors.none }
        -- highlights.CursorLine = { bg = colors.none }
      end,
    })

    vim.cmd.colorscheme("tokyonight")
  end,
}
