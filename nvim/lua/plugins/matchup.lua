return {
	{
		"andymass/vim-matchup",
		config = function ()
			vim.g.matchup_treesitter_stopline = 500
		end,
		opts = {
			treesitter = {
				stopline = 500,
			},
		},
		require ("match-up").setup ({}),
	},
}
