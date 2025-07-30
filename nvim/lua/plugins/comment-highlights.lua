return {
	{
		"leon-richardt/comment-highlights.nvim",
		version = "v0.1.0",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		opts = {},
		cmd = "CHToggle",
		keys = {
			{
				"<leader>cc",
				function ()
					require ("comment-highlights").toggle ()
				end,
				desc = "Toggle comment highlighting",
			},
		},
	},
}
