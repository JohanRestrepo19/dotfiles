return {
  "saghen/blink.cmp",
  dependencies = { "rafamadriz/friendly-snippets" },
  enabled = false,
  version = "1.*",
  opts = {
    keymap = {
      preset = "default",
      ["<C-k>"] = { "select_prev", "fallback" },
      ["<C-j>"] = { "select_next", "fallback" },
      ["<CR>"] = { "accept", "fallback" },
    },
    appearance = {
      nerd_font_variant = "normal",
    },
    completion = {
      list = {
        selection = {
          preselect = false,
          auto_insert = true,
        },
      },
      documentation = {
        auto_show = true,
        window = {
          border = "rounded",
          winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:BlinkCmpDocCursorLine,Search:None",
        },
      },
      ghost_text = { enabled = true },
      menu = {
        border = "rounded",
        winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:BlinkCmpMenuSelection,Search:None",

        draw = {
          gap = 2,
          columns = {
            { "kind_icon" },
            { "label", "label_description", gap = 1 },
            { "kind", "source_name", gap = 1 },
          },
        },
      },
    },
  },
}
