return {
	{
		{
			"akinsho/toggleterm.nvim",
			version = "*",
			lazy = true,
			opts = {},
			init = function()
				require("toggleterm").setup({
					size = 20,
					open_mapping = "<C-t>",
					shell = vim.o.shell,
					hide_numbers = false,
					start_in_insert = true,
					direction = "float",
					close_on_exit = false, -- close the terminal window when the process exits
					clear_env = false, -- use only environmental variables from `env`, passed to jobstart()
					auto_scroll = true, -- automatically scroll to the bottom on terminal output
					autochdir = false, -- when neovim changes it current directory the terminal will change it's own when next it's opened
					shade_terminals = true, -- NOTE: this option takes priority over highlights specified so if you specify Normal highlights you should set this to false
					shading_factor = -30, -- the percentage by which to lighten dark terminal background, default: -30
					shading_ratio = -3, -- the ratio of shading factor for light/dark terminal background, default: -3
					insert_mappings = true, -- whether or not the open mapping applies in insert mode
					terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
					persist_size = true,
					persist_mode = true, -- if set to true (default) the previous terminal mode will be remembered
					float_opts = {
						border = "single",
						-- width = 30,
						-- height = 30,
						-- row = 10,
						-- col = 10,
						-- winblend = 3,
						-- zindex = 5,
						title_pos = "center",
					},
				})
			end,
		},
	},
}
