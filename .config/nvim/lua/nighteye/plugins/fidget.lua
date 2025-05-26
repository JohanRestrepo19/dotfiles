return {
  "j-hui/fidget.nvim",
  tag = "v1.1.0",
  config = function()
    require("fidget").setup({
      notification = {
        window = { winblend = 0 },
      },
    })
  end,
}
