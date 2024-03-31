-- TODO: Migrate tabs config from bufferline to heirline components.

return {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    opts = {
        options = {
            mode = "tabs",
            separator_style = "thin",
            always_show_bufferline = false,
            show_buffer_close_icons = false,
            show_close_icon = true,
            color_icons = true,
        },
    },
}
