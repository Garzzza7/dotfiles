vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set("n", "<Esc><Esc>", "<cmd>nohlsearch<CR>")

--vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
--vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

vim.keymap.set("n", "ih", "<cmd>:lua vim.lsp.inlay_hint.enable(true, { 0 })<CR>", { desc = "Enable inlay hints" })
vim.keymap.set("n", "hi", "<cmd>:lua vim.lsp.inlay_hint.enable(false, { 0 })<CR>", { desc = "Disenable inlay hints" })
