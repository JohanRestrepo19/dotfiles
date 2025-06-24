return {
    "nvim-telescope/telescope.nvim",
    -- tag = "0.1.8",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
        local actions = require("telescope.actions")
        local builtin = require("telescope.builtin")

        require("telescope").setup({
            defaults = {
                -- sorting_strategy = "ascending",
                path_display = { "truncate" },
                file_ignore_patterns = { ".git/", "^dist/", ".nuxt/", "^public/" },
                prompt_prefix = " ",
                selection_caret = " ",
                layout_strategy = "flex",
                layout_config = {
                    prompt_position = "top",
                    width = 0.8,
                    height = 0.8,
                    flip_columns = 104,
                    horizontal = {
                        preview_width = 0.5,
                    },
                    vertical = {
                        preview_height = 0.5,
                        preview_cutoff = 30,
                        prompt_position = "bottom",
                    },
                },

                mappings = {
                    n = {
                        ["q"] = actions.close,
                        ["sv"] = actions.select_vertical,
                        ["ss"] = actions.select_horizontal,
                        ["st"] = actions.select_tab,
                        ["<C-k>"] = actions.preview_scrolling_up,
                        ["<C-l>"] = actions.preview_scrolling_right,
                        ["<C-j>"] = actions.preview_scrolling_down,
                        ["<C-h>"] = actions.preview_scrolling_left,
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
                    initial_mode = "normal",
                    sort_mru = true,
                    mappings = {
                        ["n"] = {
                            ["<Tab>"] = actions.delete_buffer,
                        },
                    },
                },
                find_files = { hidden = true, wrap_results = true },
                grep_string = { initial_mode = "normal" },
                lsp_references = {
                    initial_mode = "normal",
                    show_line = false,
                },
            },
        })

        require("telescope").load_extension("fzf")

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
        vim.keymap.set("n", "<leader>bb", builtin.buffers, opts)
        vim.keymap.set("n", "<leader>gr", builtin.lsp_references, opts)
    end,
}
