vim.g.netrw_sort_by = "mtime"
vim.g.netrw_banner = 0
vim.o.termguicolors = true
vim.o.background = "dark"

vim.api.nvim_create_autocmd ("ColorScheme", {
    pattern = "*",
    command = "hi Error NONE",
})

vim.api.nvim_create_autocmd ("ColorScheme", {
    pattern = "*",
    command = "hi ErrorMsg NONE",
})

vim.api.nvim_create_autocmd ("GuiEnter", {
    pattern = "*",
    command = "hi Error NONE",
})

vim.api.nvim_create_autocmd ("GuiEnter", {
    pattern = "*",
    command = "hi ErrorMsg NONE",
})

vim.cmd ("colorscheme solarized8_high")
vim.cmd ("set background=dark")
