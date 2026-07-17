-- Keymap
vim.keymap.set("n", "<C-o>", ":NERDTree<CR>")
vim.keymap.set("n", "<C-c>", ":NERDTreeToggle<CR>")
vim.keymap.set("n", "<C-f>", ":NERDTreeFind<CR>")

-- Popup Keymap
vim.keymap.set("n", "<leader>o", ":NERDTree<CR>", { desc = "Open file explorer" })
vim.keymap.set("n", "<leader>c", ":NERDTreeToggle<CR>", { desc = "Toggle file explorer" })
vim.keymap.set("n", "<leader>f", ":NERDTreeFind<CR>", { desc = "Find current file in explorer" })
