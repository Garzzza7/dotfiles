return {
	{
		"stevearc/conform.nvim",
		lazy = true,
		keys = {
			{
				"==",
				function()
					require("conform").format({ async = true, lsp_fallback = true })
				end,
				mode = "",
				desc = "Format buffer",
			},
		},
		opts = {
			notify_on_error = false,
			notify_no_formatters = true,
			-- format_on_save = function(bufnr)
			-- 	local disable_filetypes = {}
			-- 	return {
			-- 		timeout_ms = 500,
			-- 		lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
			-- 	}
			-- end,
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "black" },
				cpp = { "clang-format" },
				bash = { "beautysh" },
			},
		},
	},
}
