return {
    {
        "barrettruth/diffs.nvim",
        init = function ()
            vim.g.diffs = {
                fugitive = true,
                neogit = false,
            }
        end,
    },
}
