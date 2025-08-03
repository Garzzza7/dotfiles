return {
	{
		"brenton-leighton/multiple-cursors.nvim",
		version = "v0.15",
		opts = {
			pre_hook = function ()
				vim.cmd ("set nocul")
				vim.cmd ("NoMatchParen")
			end,
			post_hook = function ()
				vim.cmd ("set cul")
				vim.cmd ("DoMatchParen")
			end,
			custom_key_maps = {},
		},
	},
}
