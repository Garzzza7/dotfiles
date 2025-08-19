return {
	{
		"nguyenvukhang/nvim-toggler",
		version = "v0.3.1",
		dependencies = {},
		config = function ()
			require ("nvim-toggler").setup ({
				inverses = {
					["true"] = "false",
					["on"] = "off",
					["("] = ")",
					["{"] = "}",
					["["] = "]",
					["function"] = "end",
					-- ["start"] = "end",
					["starting"] = "ending",
				},
				remove_default_keybinds = true,
				remove_default_inverses = true,
				autoselect_longest_match = false,
			})
			vim.keymap.set ({ "n", "v", "i" }, "<C-a>", require ("nvim-toggler").toggle, { noremap = true, silent = true, desc = "Toggler" })
		end,
	},
}
