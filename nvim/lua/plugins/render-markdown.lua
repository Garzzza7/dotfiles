return {
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { { "nvim-treesitter/nvim-treesitter" }, { "echasnovski/mini.nvim" } }, -- if you use the mini.nvim suite
		---@module 'render-markdown'
		---@type render.md.UserConfig
		-- TODO: customize
		opts = {},
		-- config = function ()
		-- 	require ("cmp").setup ({
		-- 		sources = require ("cmp").sources ({
		-- 			{ name = "render-markdown" },
		-- 		}),
		-- 	})
		-- end,
	},
}
