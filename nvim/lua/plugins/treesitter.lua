return {
	{
		"nvim-treesitter/nvim-treesitter",
		-- version = "*",
		version = "v0.9.1",
		-- version = "v0.9.3",
		opts = {
			ensure_installed = {
				"bash",
				"c",
				"cmake",
				"comment",
				"cpp",
				"cuda",
				"json",
				"lua",
				"markdown",
				"markdown_inline",
				"python",
				"query",
				"rust",
				"vim",
				"vimdoc",
				"yaml",
			},

			auto_install = false,
			sync_install = false,

			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
				custom_captures = {},
				loaded = false,
			},
			incremental_selection = {
				enable = true,
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
