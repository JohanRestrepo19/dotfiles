-- Fixes Autocomment in newlines
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
    callback = function()
        vim.cmd("set formatoptions-=cro")
    end,
})

-- Set wrap for markdown files
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
    pattern = { "*.md", "*.mdx" },
    callback = function()
        vim.cmd("set wrap")
    end,
})


-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('NighteyeHighlightYank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Lsp keymaps
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("NighteyeLspConfig", {}),
    callback = function(ev)
        local bufopts = { noremap = true, silent = true, buffer = ev.buf }

        vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
        vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, bufopts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
        vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, bufopts)
        vim.keymap.set("n", "<C-j>", vim.diagnostic.goto_next, bufopts)
        vim.keymap.set("n", "<C-k>", vim.diagnostic.goto_prev, bufopts)
        vim.keymap.set("n", "gl", vim.diagnostic.open_float, bufopts)
    end,
})
