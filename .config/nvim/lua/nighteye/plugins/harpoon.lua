return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local harpoon = require("harpoon")

        harpoon:setup()

        vim.keymap.set("n", "<leader>m", function()
            harpoon:list():add()
        end)

        vim.keymap.set("n", "<C-e>", function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end)

        for i = 1, 4 do
            vim.keymap.set("n", "<leader>" .. i, function()
                harpoon:list():select(i)
            end)
        end

        -- Toggle previous & next buffers stored within Harpoon list
        vim.keymap.set("n", "<A-i>", function()
            harpoon:list():prev()
        end)

        vim.keymap.set("n", "<A-o>", function()
            harpoon:list():next()
        end)
    end,
}
