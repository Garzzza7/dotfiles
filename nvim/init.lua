pcall (require ("config.keymaps"))
pcall (require ("config.lazy"))
pcall (require ("config.classic"))
pcall (require ("config.apperance"))
pcall (require ("config.external_parsers"))
pcall (require ("config.neovide-config"))

vim.api.nvim_create_autocmd ("BufEnter", {
    pattern = "*.m",
    callback = function () vim.cmd ("set ft=mercury") end,
})

vim.api.nvim_create_autocmd ("BufRead", {
    pattern = "*.m",
    callback = function () vim.cmd ("set ft=mercury") end,
})

vim.api.nvim_create_autocmd ("BufNewFile", {
    pattern = "*.m",
    callback = function () vim.cmd ("set ft=mercury") end,
})

vim.api.nvim_create_autocmd ("FileType", {
    pattern = "mercury",
    command = "setlocal commentstring=%\\ %s",
})

vim.api.nvim_create_autocmd ("FileType", {
    pattern = "asm",
    command = "setlocal commentstring=#\\ %s",
})
