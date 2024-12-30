-- Fixes Autocomment in newlines
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  callback = function()
    vim.cmd("set formatoptions-=cro")
  end,
})

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("NighteyeHighlightYank", { clear = true }),
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
    -- vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
    -- vim.keymap.set("n", "K", '<cmd>Lspsaga hover_doc<cr>')
    vim.keymap.set("n", "K", function()
      local is_saga, _ = pcall(require, "lspsaga")
      if vim.bo.filetype == "help" or not is_saga then
        return vim.lsp.buf.hover()
      else
        return vim.api.nvim_command("Lspsaga hover_doc")
      end
    end, bufopts)
    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, bufopts)
    vim.keymap.set("n", "<C-j>", vim.diagnostic.goto_next, bufopts)
    vim.keymap.set("n", "<C-k>", vim.diagnostic.goto_prev, bufopts)
    vim.keymap.set("n", "gl", vim.diagnostic.open_float, bufopts)

    -- TODO: Add an outline plugin
    -- vim.keymap.set("n", "fs", '<cmd>Lspsaga outline<cr>')
  end,
})
