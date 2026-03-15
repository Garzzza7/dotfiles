return {
    {
        "barrettruth/diffs.nvim",
        commit = "e7d56e3bbe3427d26f3e4772afa2816874d39675",
        init = function ()
            vim.g.diffs = {
                fugitive = true,
                neogit = false,
            }
        end,
    },
}
