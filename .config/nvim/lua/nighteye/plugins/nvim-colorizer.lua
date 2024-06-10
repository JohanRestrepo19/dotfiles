return {
    "norcalli/nvim-colorizer.lua",
    lazy = true,
    ft = { "css", "toml" },
    keys = {
        { "<leader>cl", ":ColorizerToggle<cr>", desc = "Colorizer" },
    },
    config = function()
        require("colorizer").setup()
    end,
}
