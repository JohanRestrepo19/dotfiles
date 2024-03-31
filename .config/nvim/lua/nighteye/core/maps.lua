local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("n", "<leader>w", ":w<cr>", opts)

-- Increment/decrement
keymap("n", "+", "<C-a>", opts)
keymap("n", "-", "<C-x>", opts)

-- Select all
keymap("n", "<leader>a", "gg<S-v>G", opts)

-- Tabs
keymap("n", "te", ":tabedit<Return> ", opts)

-- Window management
keymap("n", "ss", ":split<cr>", opts)
keymap("n", "sv", ":vsplit<cr>", opts)
keymap("n", "sh", "<C-w>h", opts)
keymap("n", "sj", "<C-w>j", opts)
keymap("n", "sk", "<C-w>k", opts)
keymap("n", "sl", "<C-w>l", opts)

keymap("n", "sr", "<C-w>R", opts)
keymap("n", "sH", "<C-w>H", opts)
keymap("n", "sJ", "<C-w>J", opts)
keymap("n", "sK", "<C-w>K", opts)
keymap("n", "sL", "<C-w>L", opts)


-- Move Tab
keymap("n", "<S-Tab>", ":tabprev<cr>", opts)
keymap("n", "<tab>", ":tabnext<cr>", opts)

-- Better Vertical navigation
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")
keymap("n", "}", "<C-d>zz")
keymap("n", "{", "<C-u>zz")

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<leader><Tab>", ": bp<CR> :bd#<CR>")

-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)
keymap("i", "ññ", "<ESC>", opts)
keymap("t", "ññ", "<C-\\><C-n>", opts)

keymap("i", "<C-BS>", "<C-w>", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)

-- Alternate word wrapping
keymap("n", "<leader>tw", function()
    if vim.api.nvim_get_option_value("wrap", {}) then
        vim.cmd("set nowrap")
    else
        vim.cmd("set wrap")
    end
end, opts)

-- Delete complete word in insert mode
keymap("i", "<C-H>", "<C-w>", opts)

-- Clear hl on pressing <Esc> in normal mode
keymap("n", "<Esc>", ":nohlsearch<cr>")
