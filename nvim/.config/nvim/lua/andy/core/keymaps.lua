-- Set leader key to space
vim.g.mapleader = " "

-- Space in normal and visual mode does nothing
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Leader + s saves the file
vim.keymap.set("n", "<Leader>s", ":write<CR>", { silent = true })

-- Move normally between wrapped lines
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Move to first symbol on the line
vim.keymap.set({ "n", "v" }, "H", "^")
vim.keymap.set("n", "dH", "d^")

-- Move to last symbol of the line
vim.keymap.set({ "n", "v" }, "L", "$")
vim.keymap.set("n", "dL", "d$")

-- When replacing text from selected text, removes selected text from register after selection
vim.keymap.set("x", "<leader>p", '"_dP', { noremap = true, silent = true })

-- Scroll up and center viewport on current line
vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })
-- Scroll down and center viewport on current line
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })

-- With selected text, move it up or down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Shift + q - Quit
vim.keymap.set("n", "Q", "<C-W>q")

-- vv - Makes vertical split
vim.keymap.set("n", "vv", "<C-W>v")
-- ss - Makes horizontal split
vim.keymap.set("n", "ss", "<C-W>s")

-- Indenting in visual mode (tab/shift+tab)
vim.keymap.set("v", "<Tab>", ">gv")
vim.keymap.set("v", "<S-Tab>", "<gv")

-- Move to the end of yanked text after yank and paste
vim.cmd("vnoremap <silent> y y`]")
vim.cmd("vnoremap <silent> p p`]")
vim.cmd("nnoremap <silent> p p`]")

-- Space + h to clean search highlight
vim.keymap.set("n", "<Leader>h", ":noh<CR>", { silent = true })

-- Fixes pasting after visual selection.
vim.keymap.set("v", "p", '"_dP')

-- increment/decrement numbers
vim.keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
vim.keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- Navigate vim panes same as tmux
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")
