return {
    {
        "tpope/vim-dispatch",
        config = function ()
            -- TODO: unscuff this
            vim.api.nvim_create_autocmd ("BufEnter", {
                pattern = "*.rs",
                callback = function () vim.bo.makeprg = "cargo run" end,
            })
            vim.api.nvim_create_autocmd ("BufEnter", {
                pattern = "*.typ",
                callback = function () vim.bo.makeprg = "typst compile " .. vim.api.nvim_buf_get_name (0) end,
            })
        end,
    },
    {
        "radenling/vim-dispatch-neovim",
    },
}
