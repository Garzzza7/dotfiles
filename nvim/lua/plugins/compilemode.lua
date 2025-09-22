return {
	{
		"ej-shafran/compile-mode.nvim",
		tag = "v2.0.0",
		dependencies = {
			{ "nvim-lua/plenary.nvim", commit = "857c5ac632080dba10aae49dba902ce3abf91b35" },
			{ "m00qek/baleia.nvim", version = "v1.3.0" },
		},
		config = function ()
			vim.g.compile_mode = {
				baleia_setup = true,
			}
		end,
	},
}
