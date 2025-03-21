vim.g.netrw_liststyle = 3

vim.g.have_nerd_font = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.showmode = false
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = "no"
vim.opt.updatetime = 10000
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
---@diagnostic disable-next-line: missing-fields
vim.opt.listchars = { tab = "> ", trail = "_", nbsp = "␣" }
vim.opt.inccommand = "split"
vim.opt.cursorline = true
vim.opt.scrolloff = 5

--syncronizing clipboard between neovim and the system, in order for this to work xclip has to be installed
vim.opt.clipboard:append({ "unnamed", "unnamedplus" })

vim.opt.hlsearch = true
