return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
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
    event = "VeryLazy",
    -- lazy = true,
  },
}
