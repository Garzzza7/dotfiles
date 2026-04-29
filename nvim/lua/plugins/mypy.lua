return {
    {
        "feakuru/mypy.nvim",
        config = function ()
            require ("mypy").setup ({
                -- additional arguments to pass to invocations of `mypy`
                -- by default, it is called with `--show-error-end --follow-imports=silent`
                extra_args = { "--show-error-end", "--follow-imports=silent", "--check-untyped-defs", "--verbose" },
                -- override mypy diagnostic severities
                -- the default is { error = vim.diagnostic.severity.WARN, note = vim.diagnostic.severity.HINT }
                severities = { error = vim.diagnostic.severity.WARN, note = vim.diagnostic.severity.HINT },
                -- severities = { error = vim.diagnostic.severity.ERROR, note = vim.diagnostic.severity.INFO },
            })
        end,
    },
}
