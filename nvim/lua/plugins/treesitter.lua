return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"asm",
				"bash",
				"c",
				"cpp",
				"python",
				"go",
				"rust",
				"lua",
				"luadoc",
				"markdown",
				"vim",
				"vimdoc",
			},
			auto_install = false,
			sync_install = false,

			highlight = {
				enable = true,
				disable = {},
				additional_vim_regex_highlighting = false,
			},
			indent = { enable = true, disable = {} },
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
}
