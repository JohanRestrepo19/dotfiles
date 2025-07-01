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

-- Workaroud qf list not selectable items
vim.api.nvim_create_autocmd("FileType", {
  pattern = "qf",
  callback = function()
    -- Restablece el comportamiento normal de <CR>
    vim.keymap.set("n", "<CR>", "<CR>", { buffer = true, remap = true })
  end,
})

-- Lsp keymaps
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("NighteyeLspConfig", {}),
  callback = function(args)
    local bufopts = { noremap = true, silent = true, buffer = args.buf }

    vim.keymap.set("n", "gd", function()
      vim.lsp.buf.definition()
      vim.cmd("normal! zz")
    end, bufopts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
    vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set("n", "K", function()
      local is_saga, _ = pcall(require, "lspsaga")
      if vim.bo.filetype == "help" or not is_saga then
        return vim.lsp.buf.hover()
      else
        return vim.api.nvim_command("Lspsaga hover_doc")
      end
    end, bufopts)
    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, bufopts)
    vim.keymap.set("n", "<C-j>", function()
      vim.diagnostic.jump({ count = 1, float = true })
    end, bufopts)
    vim.keymap.set("n", "<C-k>", function()
      vim.diagnostic.jump({ count = -1, float = true })
    end, bufopts)
    vim.keymap.set("n", "gl", vim.diagnostic.open_float, bufopts)
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "qf",
  callback = function()
    vim.keymap.set("n", "q", ":cclose<CR>", { buffer = true, silent = true })
  end,
})
