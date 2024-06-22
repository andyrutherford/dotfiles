vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set clipboard=unnamed")
vim.g.mapleader = " "
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

-- Navigate vim panes same as tmux
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")
