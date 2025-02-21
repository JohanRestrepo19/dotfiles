return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup({
      signs = {
        add = { text = "│" },
        change = { text = "│" },
        delete = { text = "󰍵" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "│" },
      },
      preview_config = { border = "rounded" },
      on_attach = function(_)
        local gitsigns = require("gitsigns")
        vim.keymap.set("n", "<leader>dt", gitsigns.diffthis)
        vim.keymap.set("n", "<leader>bl", gitsigns.blame_line)

        vim.keymap.set("n", "<leader>gs", gitsigns.setqflist)
        vim.keymap.set("n", "<leader>gS", function()
          gitsigns.setqflist("all")
        end)
      end,
    })
  end,
}
