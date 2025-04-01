return {
	{
		"brenton-leighton/multiple-cursors.nvim",
		version = "*", -- Use the latest tagged version
		opts = {}, -- This causes the plugin setup function to be called
		keys = {
			{ "<C-j>", "<cmd>MultipleCursorsAddDown<CR>", mode = { "n", "x" }, desc = "Add cursor and move down" },
			{ "<C-k>", "<cmd>MultipleCursorsAddUp<CR>", mode = { "n", "x" }, desc = "Add cursor and move up" },

			{ "<C-Up>", "<cmd>MultipleCursorsAddUp<CR>", mode = { "n", "i", "x" }, desc = "Add cursor and move up" },
			{
				"<C-Down>",
				"<cmd>MultipleCursorsAddDown<CR>",
				mode = { "n", "i", "x" },
				desc = "Add cursor and move down",
			},

			{
				"<C-LeftMouse>",
				"<cmd>MultipleCursorsMouseAddDelete<CR>",
				mode = { "n", "i" },
				desc = "Add or remove cursor",
			},

			{ "<Leader>a", "<cmd>MultipleCursorsAddMatches<CR>", mode = { "n", "x" }, desc = "Add cursors to cword" },
			{
				"<Leader>A",
				"<cmd>MultipleCursorsAddMatchesV<CR>",
				mode = { "n", "x" },
				desc = "Add cursors to cword in previous area",
			},

			{
				"<Leader>d",
				"<cmd>MultipleCursorsAddJumpNextMatch<CR>",
				mode = { "n", "x" },
				desc = "Add cursor and jump to next cword",
			},
			{ "<Leader>D", "<cmd>MultipleCursorsJumpNextMatch<CR>", mode = { "n", "x" }, desc = "Jump to next cword" },

			{ "<Leader>l", "<cmd>MultipleCursorsLock<CR>", mode = { "n", "x" }, desc = "Lock virtual cursors" },
		},
	},
}
