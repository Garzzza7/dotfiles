return {
    {
        "J-Cowsert/classlayout.nvim",
        ft = { "c", "cpp" },
        opts = {},
        config = function ()
            require ("classlayout").setup ({
                keymap = "<leader>cl",
                compiler = "clang",
                args = {},
                compile_commands = true,
            })
        end,
    },
}
