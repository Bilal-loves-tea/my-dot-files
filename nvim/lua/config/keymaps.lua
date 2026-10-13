local map = vim.keymap.set

-- Move selected lines up/down in visual mode
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- Quick save / quit
map("n", "<leader>w", ":w<CR>")
map("n", "<leader>q", ":q<CR>")

