-- :help options

vim.opt.backup = false
vim.opt.clipboard = "unnamedplus"
vim.opt.cmdheight = 1
vim.opt.conceallevel = 0
vim.opt.fileencoding = "utf-8"
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 4
vim.opt.pumheight = 12
vim.opt.scrolloff = 10
vim.opt.showmode = false
vim.opt.showtabline = 1
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
-- Tabs related opts
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
--end
vim.opt.timeoutlen = 1000
vim.opt.undofile = true
vim.opt.updatetime = 300
vim.opt.wrap = false
vim.opt.writebackup = false
vim.opt.backspace = "indent,eol,start"
vim.opt.signcolumn = "yes"

vim.opt.shortmess:append("c")
vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd([[set iskeyword+=-]])

vim.opt.title = true
vim.opt.autoindent = true
vim.opt.showcmd = true
vim.opt.laststatus = 3
vim.opt.backspace = "start,eol,indent"
vim.opt.path:append({ "**" })

-- vim.opt.guicursor = ""

vim.opt.list = true
vim.opt.listchars = {
    tab = "» ",
    trail = "·",
    nbsp = "␣",
    -- eol = "↲",
}

-- vim.opt.statuscolumn = [[%!v:lua.require'nighteye.core.utils'.statuscolumn()]]
