return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-file-browser.nvim",
    },
    config = function()
        local actions = require("telescope.actions")
        local builtin = require("telescope.builtin")

        require("telescope").setup({
            defaults = {
                path_display = { "truncate" },
                file_ignore_patterns = { ".git/", "^dist/", ".nuxt/", "^public/" },
                layout_strategy = "horizontal",
                -- layout_config = { prompt_position = "top" },
                mappings = {
                    n = {
                        ["q"] = actions.close,
                        ["sv"] = actions.select_vertical,
                        ["ss"] = actions.select_horizontal,
                    },
                    i = {
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-k>"] = actions.move_selection_previous,
                        ["<C-c>"] = actions.close,
                        ["<CR>"] = actions.select_default,
                        ["<C-l>"] = actions.complete_tag,
                        ["<C-u>"] = false,
                    },
                },
            },

            pickers = {
                buffers = {
                    mappings = {
                        ["n"] = {
                            ["<Tab>"] = actions.delete_buffer,
                        },
                    },
                    initial_mode = "normal",
                },
                find_files = { hidden = true },
                grep_string = { initial_mode = "normal" },
                lsp_references = {
                    theme = "ivy",
                    initial_mode = "normal",
                    layout_config = { height = 0.5 },
                    show_line = false,
                },
            },
        })

        local opts = { noremap = true, silent = true }

        vim.keymap.set("n", "<leader>fg", builtin.git_files, opts)
        vim.keymap.set("n", "<leader>ff", builtin.find_files, opts)
        vim.keymap.set("n", "<leader>ft", builtin.live_grep, opts)
        vim.keymap.set("n", "<leader>fw", builtin.grep_string, opts)
        vim.keymap.set("n", "<leader>fW", function()
            local word = vim.fn.expand("<cWORD>")
            builtin.grep_string({ search = word })
        end, opts)
        vim.keymap.set("n", "<leader>fh", builtin.help_tags, opts)
        vim.keymap.set("n", "<leader>fb", builtin.buffers, opts)
        vim.keymap.set("n", "<leader>gr", builtin.lsp_references, opts)
    end,
}
