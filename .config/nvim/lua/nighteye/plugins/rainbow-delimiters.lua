return {
  "HiPhish/rainbow-delimiters.nvim",
  -- event = "VeryLazy",
  lazy = true,
  config = function()
    require("rainbow-delimiters.setup").setup({
      strategy = {
        [""] = "rainbow-delimiters.strategy.global",
      },
      query = {
        [""] = "rainbow-delimiters",
      },
    })
  end,
}
