return {
  "OXY2DEV/markview.nvim",
  lazy = false,
  config = function()
    require("markview").setup({
      preview = { enable = false, icon_provider = "mini" },
    })
  end,
}
