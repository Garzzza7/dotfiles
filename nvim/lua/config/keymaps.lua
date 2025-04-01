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

vim.keymap.set("n", "<F1>", "<cmd>echo 'Current time is ' . strftime('%c')<CR>", {})

vim.keymap.set("n", "<A-C-q>", "<cmd>:qa!<CR> ", {})
vim.keymap.set("n", "<A-C-q>", "<cmd>:qa!<CR> ", {})
vim.keymap.set("i", "<A-C-w>", "<cmd>:wa!<CR> ", {})
vim.keymap.set("i", "<A-C-w>", "<cmd>:wa!<CR> ", {})

vim.keymap.set("n", "<A-n>", "<cmd>:bn<CR> ", {})
vim.keymap.set("n", "<A-d>", "<cmd>:bd!<CR> ", {})
vim.keymap.set("n", "<A-p>", "<cmd>:bp<CR> ", {})
vim.keymap.set("n", "<A-w>", "<cmd>:bw<CR> ", {})
vim.keymap.set("n", "<A-l>", "<cmd>:ls<CR> ", {})

-- window stuff, conflics with space a the leader
-- vim.keymap.set("n", "<space>n", "<cmd> :tabNext<CR> ", {})
-- vim.keymap.set("n", "<space>p", "<cmd> :tabprevious<CR> ", {}
-- vim.keymap.set("n", "<space>l", "<cmd> :tabs<CR> ", {})
-- vim.keymap.set("n", "<space>w", "<cmd> :tabclose<CR> ", {})

-- keybind for sourcing
vim.keymap.set("n", "<F5>", "<cmd>:source $HOME/.config/nvim/init.lua<CR>", {})
vim.keymap.set("n", "<F5>", "<cmd>:.lua<CR>", {})
vim.keymap.set("v", "<F5>", "<cmd>:lua<CR>", {})

-- open netrw
vim.keymap.set("n", "<A-t>", "<cmd>:Ex<CR>", {})

-- lsp
vim.keymap.set("n", "<F2>", "<cmd>:LspRestart<CR>", {})
vim.keymap.set("n", "<F3>", "<cmd>:LspStart<CR>", {})
vim.keymap.set("n", "<F4>", "<cmd>:LspStop<CR>", {})
vim.keymap.set("n", "<F6>", "<cmd>:LspInfo<CR>", {})

-- moving the highlighted text
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", {})
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", {})

-- maintain copied text after deleting something
vim.keymap.set("x", "<leader>p", '"_dP', {})

-- replace the current word
vim.keymap.set("n", "<C-s><C-s>", ":%s/<C-r><C-w>/<C-r><C-w>/g<Left><Left>", {})
vim.keymap.set("n", "<C-s><C-s>", ":%s/<C-r><C-w>/<C-r><C-w>/g<Left><Left>", {})
-- vim.keymap.set("n", "<C-s><C-s>", ":%s/<C-r><C-w>/<C-r><C-w>/g<Left><Left><Left>", {})

-- inlay hints
vim.keymap.set("n", "ih", "<cmd>:lua vim.lsp.inlay_hint.enable(true, { 0 })<CR>", { desc = "Enable inlay hints" })
vim.keymap.set("n", "hi", "<cmd>:lua vim.lsp.inlay_hint.enable(false, { 0 })<CR>", { desc = "Disenable inlay hints" })

vim.api.nvim_set_keymap(
	"n",
	"<leader>al",
	"<cmd>Telescope find_files cwd=$HOME/zadania/Algos/<cr>",
	{ noremap = true, silent = true }
)
