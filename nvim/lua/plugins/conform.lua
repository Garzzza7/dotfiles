return {
    {
        "stevearc/conform.nvim",
        version = "v9.0.0",
        lazy = true,
        keys = {
            {
                "==",
                function () require ("conform").format ({ async = true, lsp_fallback = true }) end,
                mode = "",
                desc = "Format buffer",
            },
        },
        opts = {
            notify_on_error = true,
            notify_no_formatters = true,
            -- format_on_save = function(bufnr)
            -- 	local disable_filetypes = {}
            -- 	return {
            -- 		timeout_ms = 500,
            -- 		lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
            -- 	}
            -- end,
            formatters_by_ft = {
                bash = { "shfmt" },
                cpp = { "clang-format" },
                lua = { "stylua" },
                python = { "black" },
                rust = { "rust-analyzer" },
                typst = { "typstyle" },
                nix = { "nixfmt" },
            },
        },
    },
}
