CustomOilBar = function()
    local path = vim.fn.expand("%")
    path = path:gsub("oil://", "")
    return " " .. vim.fn.fnamemodify(path, ":.")
end

return {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
    keys = {
        { "<leader>e", "<cmd>Oil<cr>", desc = "Oil open parent directory" },
        {
            "<leader>E",
            function()
                local oil = require("oil")
                oil.toggle_float()
            end,
            desc = "Oil open parent directory",
        },
    },
    config = function()
        require("oil").setup({
            default_file_explorer = true,
            colums = {
                "icon",
            },
            keymaps = {
                ["q"] = "actions.close",
                ["sv"] = { "actions.select", opts = { vertical = true }, desc = "Open the entry in a vertical split" },
                ["ss"] = {
                    "actions.select",
                    opts = { horizontal = true },
                    desc = "Open the entry in a horizontal split",
                },
            },
            win_options = {
                winbar = "%{v:lua.CustomOilBar()}",
            },
            view_options = {
                show_hidden = true,
            },
            delete_to_trash = true,
        })
    end,
}
