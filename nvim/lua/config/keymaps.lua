vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set ({ "n" }, "<Esc><Esc>", "<cmd>nohlsearch<cr>", { noremap = true, silent = true, desc = "Turn off hlsearch" })

vim.keymap.set ({ "n" }, "Q", "<nop>", { noremap = true, silent = true, desc = "Disable Q" })

vim.keymap.set ({ "n", "v" }, "<Up>", '<cmd>echo "xddd"<cr>', { noremap = true, silent = true, desc = "xddd" })
vim.keymap.set ({ "n", "v" }, "<Down>", '<cmd>echo "xddd"<cr>', { noremap = true, silent = true, desc = "xddd" })
vim.keymap.set ({ "n", "v" }, "<Left>", '<cmd>echo "xddd"<cr>', { noremap = true, silent = true, desc = "xddd" })
vim.keymap.set ({ "n", "v" }, "<Right>", '<cmd>echo "xddd"<cr>', { noremap = true, silent = true, desc = "xddd" })

vim.keymap.set ({ "n" }, "<leader>z", vim.diagnostic.goto_prev, { noremap = true, silent = true, desc = "Go to previous diagnostic message" })
vim.keymap.set ({ "n" }, "<leader>x", vim.diagnostic.goto_next, { noremap = true, silent = true, desc = "Go to next diagnostic message" })
vim.keymap.set ({ "n" }, "<leader>e", vim.diagnostic.open_float, { noremap = true, silent = true, desc = "Show diagnostic [E]rror messages" })

vim.keymap.set ({ "n" }, "<leader>q", vim.diagnostic.setloclist, { noremap = true, silent = true, desc = "Open diagnostic [Q]uickfix list" })

vim.keymap.set ({ "t" }, "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true, desc = "Exit terminal mode" })
vim.keymap.set ({ "n" }, "<C-h>", "<C-w><C-h>", { noremap = true, silent = true, desc = "Move focus to the left window" })
vim.keymap.set ({ "n" }, "<C-l>", "<C-w><C-l>", { noremap = true, silent = true, desc = "Move focus to the right window" })
vim.keymap.set ({ "n" }, "<C-j>", "<C-w><C-j>", { noremap = true, silent = true, desc = "Move focus to the lower window" })
vim.keymap.set ({ "n" }, "<C-k>", "<C-w><C-k>", { noremap = true, silent = true, desc = "Move focus to the upper window" })

vim.keymap.set ({ "n", "v", "i" }, "<F1>", "<cmd>echo 'Current time is ' . strftime('%c')<cr>", { noremap = true, silent = true, desc = "Display current time" })

vim.keymap.set ({ "n", "i", "v" }, "<A-C-q>", "<cmd>qa!<cr> ", { noremap = true, silent = true, desc = "Quit all" })
vim.keymap.set ({ "n", "i", "v" }, "<A-C-w>", "<cmd>wa!<cr> ", { noremap = true, silent = true, desc = "Write all" })

vim.keymap.set ({ "n", "i", "v" }, "<A-n>", "<cmd>bn<cr> ", { noremap = true, silent = true, desc = "Next buffer" })
vim.keymap.set ({ "n", "i", "v" }, "<A-d>", "<cmd>bd!<cr> ", { noremap = true, silent = true, desc = "Delete Buffer" })
vim.keymap.set ({ "n", "i", "v" }, "<A-p>", "<cmd>bp<cr> ", { noremap = true, silent = true, desc = "Previous buffer" })
vim.keymap.set ({ "n", "i", "v" }, "<A-w>", "<cmd>bw<cr> ", { noremap = true, silent = true, desc = "Write buffer" })
vim.keymap.set ({ "n", "i", "v" }, "<A-l>", "<cmd>ls<cr> ", { noremap = true, silent = false, desc = "Display buffers" })

-- TODO: make tab stuff not collide with anything
-- vim.keymap.set({ "n", "i", "v" }, "<C-n>", "<cmd>tabNext<cr> ", { noremap = true, silent = true, desc = "Next tab" })
-- vim.keymap.set({ "n", "i", "v" }, "<C-d>", "<cmd>tabclose<cr> ", { noremap = true, silent = true, desc = "Delete tab" })
-- vim.keymap.set(
-- 	{ "n", "i", "v" },
-- 	"<C-p>",
-- 	"<cmd>tabprevious<cr> ",
-- 	{ noremap = true, silent = true, desc = "Previous tab" }
-- )

-- window stuff, conflics with space a the leader
-- vim.keymap.set ({ "n" }, "<leader>n", "<cmd> :tabNext<cr> ", { noremap = true, silent = true, desc = "TODO" })
-- vim.keymap.set ({ "n" }, "<leader>p", "<cmd> :tabprevious<cr> ", { noremap = true, silent = true, desc = "TODO" })
-- vim.keymap.set ({ "n" }, "<leader>l", "<cmd> :tabs<cr> ", { noremap = true, silent = true, desc = "TODO" })
-- vim.keymap.set ({ "n" }, "<leader>w", "<cmd> :tabclose<cr> ", { noremap = true, silent = true, desc = "TODO" })

vim.keymap.set ({ "n" }, "<F5>", "<cmd>source $HOME/.config/nvim/init.lua<cr>", { noremap = true, silent = true, desc = "Reload config" })

vim.keymap.set ({ "n" }, "<F5>", "<cmd>.lua<cr>", { noremap = true, silent = true, desc = "Reload config" })
vim.keymap.set ({ "v" }, "<F5>", "<cmd>lua<cr>", { noremap = true, silent = true, desc = "Reload config" })

vim.keymap.set ({ "n" }, "<A-t>", "<cmd>Ex<cr>", { noremap = true, silent = true, desc = "Open netrw" })

vim.keymap.set ({ "n", "v", "i" }, "<F2>", "<cmd>LspRestart<cr>", { noremap = true, silent = true, desc = "Restart lsp" })

vim.keymap.set ({ "n", "v", "i" }, "<F3>", "<cmd>LspStart<cr>", { noremap = true, silent = true, desc = "Start lsp" })
vim.keymap.set ({ "n", "v", "i" }, "<F4>", "<cmd>LspStop<cr>", { noremap = true, silent = true, desc = "Stop lsp" })
vim.keymap.set ({ "n", "v", "i" }, "<F6>", "<cmd>LspInfo<cr>", { noremap = true, silent = true, desc = "Lsp info" })

vim.keymap.set ({ "v" }, "J", ":m '>+1<cr>gv=gv", { noremap = true, silent = true, desc = "Move highlighted text down" })
vim.keymap.set ({ "v" }, "K", ":m '<-2<cr>gv=gv", { noremap = true, silent = true, desc = "Move highlighted text up" })

vim.keymap.set ({ "x" }, "<leader>p", '"_dP', { noremap = true, silent = true, desc = "Remember copied stuff after deletion" })

vim.keymap.set ({ "n" }, "<C-s><C-a>", ":%s/<C-r><C-w>//g<Left><Left>", { noremap = true, silent = false, desc = "Replace word from under the cursor" })

vim.keymap.set ({ "n" }, "<C-s><C-s>", ":%s/<C-r><C-w>//gc<Left><Left><Left>", { noremap = true, silent = false, desc = "Replace word from under the cursor" })

vim.keymap.set ({ "v" }, "<C-s><C-h>", '"ay:%s/<C-r>a//gc<Left><Left><Left>', { noremap = true, silent = false, desc = "Replace word from the highlight" })

vim.keymap.set ({ "n" }, "<C-i><C-h>", "<cmd>lua vim.lsp.inlay_hint.enable(true, { 0 })<cr>", { noremap = true, silent = true, desc = "Enable inlay hints" })

vim.keymap.set ({ "n" }, "<C-h><C-i>", "<cmd>lua vim.lsp.inlay_hint.enable(false, { 0 })<cr>", { noremap = true, silent = true, desc = "Disable inlay hints" })

vim.keymap.set ({ "n" }, "<space>lg", "<cmd>LazyGit<cr>", { noremap = true, silent = true, desc = "Open Lazygit" })

vim.keymap.set ({ "n" }, "<C-j>", "<cmd>MultipleCursorsAddDown<cr>", { noremap = true, silent = true, desc = "Add cursor and move down" })

vim.keymap.set ({ "n" }, "<C-k>", "<cmd>MultipleCursorsAddUp<cr>", { noremap = true, silent = true, desc = "Add cursor and move up" })

vim.keymap.set ({ "n" }, "<C-Up>", "<cmd>MultipleCursorsAddUp<cr>", { noremap = true, silent = true, desc = "Add cursor and move up" })

vim.keymap.set ({ "n" }, "<C-Down>", "<cmd>MultipleCursorsAddDown<cr>", { noremap = true, silent = true, desc = "Add cursor and move down" })

vim.keymap.set ({ "n" }, "<C-LeftMouse>", "<cmd>MultipleCursorsMouseAddDelete<cr>", { noremap = true, silent = true, desc = "Add or remove cursor" })

vim.keymap.set ({ "n" }, "<space>a", "<cmd>MultipleCursorsAddMatches<cr>", { noremap = true, silent = true, desc = "Add cursors to cword" })

vim.keymap.set ({ "n" }, "<space>A", "<cmd>MultipleCursorsAddMatchesV<cr>", { noremap = true, silent = true, desc = "Add cursors to cword in previous area" })

vim.keymap.set ({ "n" }, "<space>d", "<cmd>MultipleCursorsAddJumpNextMatch<cr>", { noremap = true, silent = true, desc = "Add cursor and jump to next cword" })

vim.keymap.set ({ "n" }, "<space>D", "<cmd>MultipleCursorsJumpNextMatch<cr>", { noremap = true, silent = true, desc = "Jump to next cword" })

vim.keymap.set ({ "n" }, "<space>l", "<cmd>MultipleCursorsLock<cr>", { noremap = true, silent = true, desc = "Lock virtual cursors" })

-- FIX: fix this bs improper indexing
vim.keymap.set ({ "n" }, "<A-1>", "<cmd>b1<cr>", { noremap = true, silent = true, desc = "Go to buffer 1" })
vim.keymap.set ({ "n" }, "<A-2>", "<cmd>b2<cr>", { noremap = true, silent = true, desc = "Go to buffer 2" })
vim.keymap.set ({ "n" }, "<A-3>", "<cmd>b3<cr>", { noremap = true, silent = true, desc = "Go to buffer 3" })
vim.keymap.set ({ "n" }, "<A-4>", "<cmd>b4<cr>", { noremap = true, silent = true, desc = "Go to buffer 4" })
vim.keymap.set ({ "n" }, "<A-5>", "<cmd>b5<cr>", { noremap = true, silent = true, desc = "Go to buffer 5" })
vim.keymap.set ({ "n" }, "<A-6>", "<cmd>b6<cr>", { noremap = true, silent = true, desc = "Go to buffer 6" })
vim.keymap.set ({ "n" }, "<A-7>", "<cmd>b7<cr>", { noremap = true, silent = true, desc = "Go to buffer 7" })
vim.keymap.set ({ "n" }, "<A-8>", "<cmd>b8<cr>", { noremap = true, silent = true, desc = "Go to buffer 8" })
vim.keymap.set ({ "n" }, "<A-9>", "<cmd>b9<cr>", { noremap = true, silent = true, desc = "Go to buffer 9" })

vim.api.nvim_set_keymap ("n", "<leader>al", "<cmd>Telescope find_files cwd=$HOME/zadania/Algos/<cr>", { noremap = true, silent = true, desc = "Open Algos" })

vim.api.nvim_set_keymap ("n", "<leader>mf", "<cmd>Telescope media_files<cr>", { noremap = true, silent = true, desc = "Media Files" })

vim.keymap.set ({ "n", "i", "x" }, "<C-t>", "<cmd>ToggleTerm dir=%:p:h<cr>", { noremap = true, silent = true, desc = "Open ToggleTerm" })

vim.keymap.set ({ "n" }, "<F8>", "<esc> :w <cr> :!comp.sh $(echo %)<cr>", { noremap = true, silent = true, desc = "Compile and run C++" })

vim.keymap.set ({ "n" }, "<F9>", "<esc> :w <cr> :!python3<cr>", { noremap = true, silent = true, desc = "Open Python" })

vim.keymap.set ({ "n" }, "<leader>td", "<cmd>TodoTelescope<cr>", { noremap = true, silent = true, desc = "Open TODOs" })
