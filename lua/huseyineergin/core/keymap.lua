vim.g.mapleader = " "

vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

-- append below line to current
vim.keymap.set("n", "J", "mzJ`z")

-- keep search term in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- half page jump
vim.keymap.set("n", "<C-u>", "<C-u>zz") -- to the top
vim.keymap.set("n", "<C-d>", "<C-d>zz") -- to the bottom

-- window management
vim.keymap.set("n", "<leader>sv", "<C-w>v") -- split vertically
vim.keymap.set("n", "<leader>sh", "<C-w>s") -- split horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=") -- make splits equal size
vim.keymap.set("n", "<leader>sx", ":close<CR>") -- close current split

vim.keymap.set("n", "<C-Up>", ":resize +1<CR>") -- increase size horizontally
vim.keymap.set("n", "<C-Down>", ":resize -1<CR>") -- decrease size horizontally
vim.keymap.set("n", "<C-Left>", ":vert resize -1<CR>") -- decrease size vertically
vim.keymap.set("n", "<C-Right>", ":vert resize +1<CR>") -- increase size vertically

-- move the highlighted part
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- prev
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- next

-- delete without saving the value
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- copy to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]]) -- entire line

-- paste from system clipboard
vim.keymap.set({ "n", "v" }, "<leader>p", [["+p]])
vim.keymap.set("v", "<leader>P", [["+P]]) -- dont lose the value

-- open markdown preview
vim.keymap.set("n", "<leader>md", ":MarkdownPreview<CR>")

-- replace the word that cursor is currently on
vim.keymap.set("n", "<leader>rw", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
