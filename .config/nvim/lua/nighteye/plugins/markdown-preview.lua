-- install with yarn or npm
return {
  "iamcco/markdown-preview.nvim",
  enabled = true,
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  build = "cd app && npm install && git restore .",
  init = function()
    vim.g.mkdp_filetypes = { "markdown" }
  end,
  ft = { "markdown" },
}
