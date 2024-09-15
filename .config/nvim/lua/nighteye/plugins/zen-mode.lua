return {
  "folke/zen-mode.nvim",
  keys = {
    { "<leader>zm", ":ZenMode<cr>", silent = true, mode = "n" },
  },
  config = function()
    local zenmode = require("zen-mode")
    zenmode.setup({
      window = {
        width = 0.60,
      },
    })

    vim.keymap.set("n", "<leader>zm", zenmode.toggle)
  end,
}
