vim.g.netrw_liststyle = 3

vim.g.have_nerd_font = false
vim.opt.number = false
vim.opt.relativenumber = false
vim.opt.mouse = "a"
vim.opt.showmode = false
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = "no"
vim.opt.updatetime = 4000
vim.opt.timeoutlen = 3000
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
---@diagnostic disable-next-line: missing-fields
vim.opt.listchars = { tab = "> ", trail = "_", nbsp = "␣" }
vim.opt.inccommand = "split"
vim.opt.cursorline = true
vim.opt.scrolloff = 8

-- syncronizing clipboard between neovim and the system, in order for this to work xclip has to be installed
-- vim.opt.clipboard:append({ "unnamed", "unnamedplus" })

vim.opt.hlsearch = true
vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"

-- default terminal
vim.g.terminal_emulator = "kitty"
