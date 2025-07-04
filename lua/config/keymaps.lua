local keymap = vim.keymap

-- Set leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Such nonsense
vim.keymap.set("n", "<C-i>", "<C-i>")

-- Delete single character without copying into register
keymap.set("n", "x", '"_x')

-- move between windows
keymap.set("n", "<M-h>", "<C-w>h")
keymap.set("n", "<M-j>", "<C-w>j")
keymap.set("n", "<M-k>", "<C-w>k")
keymap.set("n", "<M-l>", "<C-w>l")
