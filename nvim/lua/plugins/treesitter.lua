return {
	{
		"nvim-treesitter/nvim-treesitter",
		-- version = "*",
		version = "v0.9.1",
		-- version = "v0.9.3",
		opts = {
			ensure_installed = {
				"c",
				"cpp",
				"lua",
				"markdown",
				"query",
				"vimdoc",
			},

			auto_install = false,
			sync_install = false,

			highlight = {
				additional_vim_regex_highlighting = false,
				custom_captures = {},
				enable = true,
				loaded = false,
			},
			incremental_selection = {
				enable = false,
				keymaps = {
					init_selection = "gnn",
					node_decremental = "grm",
					node_incremental = "grn",
					scope_incremental = "grc",
				},
			},
			indent = {
				enable = false,
			},
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
}
