return {
    {
        "tpope/vim-dispatch",
        config = function ()
            -- TODO: unscuff this
            vim.api.nvim_create_autocmd ("BufEnter", {
                pattern = "*.rs",
                callback = function () vim.bo.makeprg = "cargo run" end,
            })
        end,
    },
    {
        "radenling/vim-dispatch-neovim",
    },
}
