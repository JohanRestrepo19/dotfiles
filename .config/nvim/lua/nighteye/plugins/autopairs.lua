return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    -- lazy = true,
    -- enabled = false,
    config = function()
      require("nvim-autopairs").setup({
        check_ts = true,
        ts_config = {
          lua = { "string", "source" },
          javascript = { "string", "template_string" },
          java = false,
        },
      })
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    opts = true,
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
    -- event = "VeryLazy",
    lazy = false,
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
  },
}
