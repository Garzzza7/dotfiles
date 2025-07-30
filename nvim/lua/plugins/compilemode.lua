return {
	{
		"ej-shafran/compile-mode.nvim",
		tag = "v2.0.0",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "m00qek/baleia.nvim", version = "v1.3.0" },
		},
		config = function ()
			vim.g.compile_mode = {
				baleia_setup = true,
			}
		end,
	},
}
