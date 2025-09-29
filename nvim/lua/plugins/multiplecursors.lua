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
		keys = {
			{ "<C-j>", "<Cmd>MultipleCursorsAddDown<CR>", mode = { "n", "x" }, desc = "Add cursor and move down" },
			{ "<C-k>", "<Cmd>MultipleCursorsAddUp<CR>", mode = { "n", "x" }, desc = "Add cursor and move up" },

			{ "<C-Up>", "<Cmd>MultipleCursorsAddUp<CR>", mode = { "n", "i", "x" }, desc = "Add cursor and move up" },
			{ "<C-Down>", "<Cmd>MultipleCursorsAddDown<CR>", mode = { "n", "i", "x" }, desc = "Add cursor and move down" },

			{ "<C-LeftMouse>", "<Cmd>MultipleCursorsMouseAddDelete<CR>", mode = { "n", "i" }, desc = "Add or remove cursor" },

			{ "<Leader>m", "<Cmd>MultipleCursorsAddVisualArea<CR>", mode = { "x" }, desc = "Add cursors to the lines of the visual area" },

			{ "<Leader>a", "<Cmd>MultipleCursorsAddMatches<CR>", mode = { "n", "x" }, desc = "Add cursors to cword" },
			{ "<Leader>A", "<Cmd>MultipleCursorsAddMatchesV<CR>", mode = { "n", "x" }, desc = "Add cursors to cword in previous area" },

			{ "<Leader>d", "<Cmd>MultipleCursorsAddJumpNextMatch<CR>", mode = { "n", "x" }, desc = "Add cursor and jump to next cword" },
			{ "<Leader>D", "<Cmd>MultipleCursorsJumpNextMatch<CR>", mode = { "n", "x" }, desc = "Jump to next cword" },

			{ "<Leader>l", "<Cmd>MultipleCursorsLock<CR>", mode = { "n", "x" }, desc = "Lock virtual cursors" },
		},
	},
}
