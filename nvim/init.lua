pcall (require ("config.keymaps"))
pcall (require ("config.lazy"))
pcall (require ("config.classic"))
pcall (require ("config.apperance"))
pcall (require ("config.external_parsers"))

-- vim.api.nvim_create_autocmd ("BufEnter", {
-- 	pattern = "*",
-- 	command = "silent! lcd %:p:h",
-- })

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
