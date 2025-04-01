vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set({ "n", "v", "i" }, "<Esc><Esc>", "<cmd>nohlsearch<cr>")

--vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
--vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

vim.keymap.set({ "n", "v", "i" }, "<F1>", "<cmd>echo 'Current time is ' . strftime('%c')<cr>", {})

vim.keymap.set({ "n", "i", "v" }, "<A-C-q>", "<cmd>qa!<cr> ", {})
vim.keymap.set({ "n", "i", "v" }, "<A-C-w>", "<cmd>wa!<cr> ", {})

vim.keymap.set({ "n", "i", "v" }, "<A-n>", "<cmd>bn<cr> ", {})
vim.keymap.set({ "n", "i", "v" }, "<A-d>", "<cmd>bd!<cr> ", {})
vim.keymap.set({ "n", "i", "v" }, "<A-p>", "<cmd>bp<cr> ", {})
vim.keymap.set({ "n", "i", "v" }, "<A-w>", "<cmd>bw<cr> ", {})
vim.keymap.set({ "n", "i", "v" }, "<A-l>", "<cmd>ls<cr> ", {})

-- window stuff, conflics with space a the leader
-- vim.keymap.set("n", "<space>n", "<cmd> :tabNext<cr> ", {})
-- vim.keymap.set("n", "<space>p", "<cmd> :tabprevious<cr> ", {}
-- vim.keymap.set("n", "<space>l", "<cmd> :tabs<cr> ", {})
-- vim.keymap.set("n", "<space>w", "<cmd> :tabclose<cr> ", {})

-- keybind for sourcing
vim.keymap.set("n", "<F5>", "<cmd>source $HOME/.config/nvim/init.lua<cr>", {})
vim.keymap.set("n", "<F5>", "<cmd>.lua<cr>", {})
vim.keymap.set("v", "<F5>", "<cmd>lua<cr>", {})

-- open netrw
vim.keymap.set("n", "<A-t>", "<cmd>Ex<cr>", {})

-- lsp
vim.keymap.set({ "n", "v", "i" }, "<F2>", "<cmd>LspRestart<cr>", {})
vim.keymap.set({ "n", "v", "i" }, "<F3>", "<cmd>LspStart<cr>", {})
vim.keymap.set({ "n", "v", "i" }, "<F4>", "<cmd>LspStop<cr>", {})
vim.keymap.set({ "n", "v", "i" }, "<F6>", "<cmd>LspInfo<cr>", {})

-- moving the highlighted text
vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv", {})
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv", {})

-- maintain copied text after deleting something
vim.keymap.set("x", "<leader>p", '"_dP', {})

-- replace the current word
vim.keymap.set("n", "<C-s><C-a>", ":%s/<C-r><C-w>/<C-r><C-w>/g<Left><Left>", {})
vim.keymap.set("n", "<C-s><C-s>", ":%s/<C-r><C-w>/<C-r><C-w>/gc<Left><Left><Left>", {})

-- inlay hints
vim.keymap.set("n", "ih", "<cmd>lua vim.lsp.inlay_hint.enable(true, { 0 })<cr>", { desc = "Enable inlay hints" })
vim.keymap.set("n", "hi", "<cmd>lua vim.lsp.inlay_hint.enable(false, { 0 })<cr>", { desc = "Disenable inlay hints" })

-- Lazygit
vim.keymap.set("n", "<space>lg", "<cmd>LazyGit<cr>", { desc = "Open Lazygit" })

-- MultipleCursors keymaps
vim.keymap.set("n", "<C-j>", "<cmd>MultipleCursorsAddDown<cr>", { desc = "Add cursor and move down" })
vim.keymap.set("n", "<C-k>", "<cmd>MultipleCursorsAddUp<cr>", { desc = "Add cursor and move up" })
vim.keymap.set("n", "<C-Up>", "<cmd>MultipleCursorsAddUp<cr>", { desc = "Add cursor and move up" })
vim.keymap.set("n", "<C-Down>", "<cmd>MultipleCursorsAddDown<cr>", { desc = "Add cursor and move down" })
vim.keymap.set("n", "<C-LeftMouse>", "<cmd>MultipleCursorsMouseAddDelete<cr>", { desc = "Add or remove cursor" })
vim.keymap.set("n", "<space>a", "<cmd>MultipleCursorsAddMatches<cr>", { desc = "Add cursors to cword" })
vim.keymap.set(
	"n",
	"<space>A",
	"<cmd>MultipleCursorsAddMatchesV<cr>",
	{ desc = "Add cursors to cword in previous area" }
)
vim.keymap.set(
	"n",
	"<space>d",
	"<cmd>MultipleCursorsAddJumpNextMatch<cr>",
	{ desc = "Add cursor and jump to next cword" }
)
vim.keymap.set("n", "<space>D", "<cmd>MultipleCursorsJumpNextMatch<cr>", { desc = "Jump to next cword" })
vim.keymap.set("n", "<space>l", "<cmd>MultipleCursorsLock<cr>", { desc = "Lock virtual cursors" })
-- Cursors and here

vim.api.nvim_set_keymap(
	"n",
	"<leader>al",
	"<cmd>Telescope find_files cwd=$HOME/zadania/Algos/<cr>",
	{ noremap = true, silent = true }
)
