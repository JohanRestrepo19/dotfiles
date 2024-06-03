return {
    "HiPhish/rainbow-delimiters.nvim",
    config = function()
        vim.api.nvim_set_hl(0, "RainbowDelimiterYellow", { fg = "#FFD700" })
        vim.api.nvim_set_hl(0, "RainbowDelimiterPurple", { fg = "#DA70D6" })
        vim.api.nvim_set_hl(0, "RainbowDelimiterBlue", { fg = "#87CEFA" })
        vim.api.nvim_set_hl(0, "RainbowDelimiterOrange", { fg = "#D08770" })
        vim.api.nvim_set_hl(0, "RainbowDelimiterRed", { fg = "#BF616A" })
        vim.api.nvim_set_hl(0, "RainbowDelimiterGray", { fg = "#abb2c0" })

        vim.g.rainbow_delimiters = {
            query = {
                -- [""] = "rainbow-delimiters",
                [""] = "rainbow-parens",
                lua = "rainbow-blocks",
            },

            highlight = {
                "RainbowDelimiterYellow",
                "RainbowDelimiterViolet",
                "RainbowDelimiterBlue",
                "RainbowDelimiterOrange",
                "RainbowDelimiterRed",
                "RainbowDelimiterGray",
            },
        }
    end,
}
-- "editorBracketHighlight.foreground1": "#FFD700",
-- "editorBracketHighlight.foreground2": "#DA70D6",
-- "editorBracketHighlight.foreground3": "#87CEFA",
-- "editorBracketHighlight.foreground4": "#D08770",
-- "editorBracketHighlight.foreground5": "#BF616A",
-- "editorBracketHighlight.foreground6": "#abb2c0",
-- "editorBracketHighlight.unexpectedBracket.foreground": "#db6165"
