vim.g.netrw_liststyle = 3

vim.g.have_nerd_font = false
vim.opt.breakindent = true
vim.opt.cursorline = true
vim.opt.ignorecase = true
vim.opt.inccommand = "split"
vim.opt.list = true
vim.opt.listchars = { tab = "> ", trail = "_", nbsp = "␣" }
vim.opt.mouse = ""
vim.opt.number = false
vim.opt.relativenumber = false
vim.opt.scrolloff = 8
vim.opt.showmode = false
vim.opt.signcolumn = "no"
vim.opt.smartcase = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.timeoutlen = 3000
vim.opt.undofile = true
vim.opt.updatetime = 4000

-- syncronizing clipboard between neovim and the system, in order for this to work xclip has to be installed
-- vim.opt.clipboard:append({ "unnamed", "unnamedplus" })

vim.opt.hlsearch = true
vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"

-- default terminal
vim.g.terminal_emulator = "st"

vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
