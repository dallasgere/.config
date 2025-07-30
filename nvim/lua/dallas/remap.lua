-- setting my leaders
vim.g.mapleader = " "
-- vim.keymap.set("n", "<leader>e", vim.cmd.Explore)

-- these are really cool and make me able to move stuff up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- gets rid of currend line 
vim.keymap.set("n", "J", "mzJ`z")

-- jump half of the file
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- remaping escape
vim.keymap.set("n", "<C-c>", "<Esc>")

-- lsp
-- vim.api.nvim_set_keymap("n", "<leader>b", "<cmd>lua vim.lsp.buf.declaration()<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>j", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>r", "<cmd>lua vim.lsp.buf.references()<CR>", { noremap = true, silent = true })
