return {
	{
		"ej-shafran/compile-mode.nvim",
		-- HARDCODED TAG , CHECK THE REPO FOR THE NEWEST VERSION
		tag = "v5.3.2",
		lazy = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "m00qek/baleia.nvim", tag = "v1.3.0" },
		},
		config = function()
			---@type CompileModeOpts
			vim.g.compile_mode = {
				baleia_setup = true,
			}
		end,
	},
}
