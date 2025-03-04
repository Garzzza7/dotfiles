---@diagnostic disable: undefined-doc-name
return {
	"ej-shafran/compile-mode.nvim",
	tag = "v2.0.0",
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
}
