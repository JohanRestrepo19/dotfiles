return {
    "nvimdev/lspsaga.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    name = "lspsaga",
    lazy = true,
    config = function()
        require("lspsaga").setup({
            diagnostic = { enable = false },
            symbol_in_winbar = { enable = false },
            lightbulb = { enable = false, sign = false },
        })
    end,
}
