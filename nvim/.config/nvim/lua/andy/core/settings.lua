vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set clipboard=unnamed")

vim.g.background = "light"
vim.opt.swapfile = false

vim.o.hlsearch = true
vim.wo.number = true
vim.wo.signcolumn = "yes"
vim.o.completeopt = "menuone,noselect"
vim.opt.autoread = true
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.showbreak = "␍"

-- Scroll settings
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 15
vim.opt.sidescroll = 5

