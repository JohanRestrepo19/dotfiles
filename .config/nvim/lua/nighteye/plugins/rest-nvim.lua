return {
    {
        "vhyrro/luarocks.nvim",
        priority = 1000,
        config = true,
    },
    {
        "rest-nvim/rest.nvim",
        ft = "http",
        dependencies = { "luarocks.nvim" },
        keys = {
            { "<leader>rr", ":Rest run<cr>", desc = "Run request under the cursor" },
            { "<leader>rl", ":Rest run last<cr>", desc = "Re-run latest request" },
        },
        config = function()
            require("rest-nvim").setup()
        end,
    },
}
