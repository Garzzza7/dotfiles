return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"asm",
				"nasm",
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
				"glsl",
				"gitignore",
				"haskell",
				"json",
				"ocaml",
				"ocaml_interface",
				"html",
				"toml",
				"xml",
				"yaml",
			},
			auto_install = false,
			sync_install = false,

			highlight = {
				enable = true,
				disable = {},
				additional_vim_regex_highlighting = true,
			},
			indent = { enable = true, disable = {} },
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
}
