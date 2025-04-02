return {
	{
		"nvim-telescope/telescope.nvim",
		event = "VimEnter",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
				cond = function()
					return vim.fn.executable("make") == 1
				end,
			},
			{ "nvim-telescope/telescope-ui-select.nvim" },
		},
		config = function()
			require("telescope").setup({
				defaults = {
					layout_strategy = "vertical",
					layout_config = { height = 0.95, width = 0.95 },
				},
				pickers = {
					help_tags = {
						layout_strategy = "vertical",
						layout_config = { height = 0.95, width = 0.95 },
					},

					keymaps = {
						layout_strategy = "vertical",
						layout_config = { height = 0.95, width = 0.95 },
					},

					fd = {
						layout_strategy = "vertical",
						layout_config = { height = 0.95, width = 0.95 },
					},

					builtin = {
						layout_strategy = "vertical",
						layout_config = { height = 0.95, width = 0.95 },
					},

					grep_string = {
						layout_strategy = "vertical",
						layout_config = { height = 0.95, width = 0.95 },
					},

					live_grep = {
						layout_strategy = "vertical",
						layout_config = { height = 0.95, width = 0.95 },
					},

					diagnostics = {
						layout_strategy = "vertical",
						layout_config = { height = 0.95, width = 0.95 },
					},

					resume = {
						layout_strategy = "vertical",
						layout_config = { height = 0.95, width = 0.95 },
					},

					oldfiles = {
						layout_strategy = "vertical",
						layout_config = { height = 0.95, width = 0.95 },
					},

					buffers = {
						layout_strategy = "vertical",
						layout_config = { height = 0.95, width = 0.95 },
					},

					man_pages = {
						layout_strategy = "vertical",
						layout_config = { height = 0.95, width = 0.95 },
					},

					colorscheme = {
						layout_strategy = "vertical",
						layout_config = { height = 0.95, width = 0.95 },
					},

					marks = {
						layout_strategy = "vertical",
						layout_config = { height = 0.95, width = 0.95 },
					},

					git_status = {
						layout_strategy = "vertical",
						layout_config = { height = 0.95, width = 0.95 },
					},

					git_files = {
						layout_strategy = "vertical",
						layout_config = { height = 0.95, width = 0.95 },
					},

					current_buffer_fuzzy_find = {
						layout_strategy = "vertical",
						layout_config = { height = 0.95, width = 0.95 },
					},
				},
				extensions = {
					["ui-select"] = {
						-- require("telescope.themes").get_ivy(),
					},
				},
			})

			pcall(require("telescope").load_extension, "fzf")
			pcall(require("telescope").load_extension, "ui-select")

			local builtin = require("telescope.builtin")

			vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })

			vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })

			vim.keymap.set("n", "<leader>sf", builtin.fd, { desc = "[S]earch [F]iles" })

			vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })

			vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })

			vim.keymap.set("n", "<leader>sgg", builtin.live_grep, { desc = "[S]earch by [G]rep" })

			vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })

			vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })

			vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })

			vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })

			vim.keymap.set("n", "<leader>ma", builtin.man_pages, { desc = "Display manpages" })

			vim.keymap.set("n", "<leader>col", builtin.colorscheme, { desc = "Display colorschemes" })

			vim.keymap.set("n", "<leader>mn", builtin.marks, { desc = "Display marks" })

			vim.keymap.set("n", "<leader>gs", builtin.git_status, { desc = "Display git status" })

			vim.keymap.set("n", "<leader>sgf", builtin.git_files, { desc = "Search git files" })

			vim.keymap.set("n", "gd", builtin.lsp_definitions, { desc = "[G]oto [D]efinition" })

			vim.keymap.set("n", "gr", builtin.lsp_references, { desc = "[G]oto [R]eferences" })

			vim.keymap.set("n", "gi", builtin.lsp_implementations, { desc = "[G]oto [I]mplementation" })

			vim.keymap.set("n", "<leader>ds", builtin.lsp_document_symbols, { desc = "[D]ocument [S]ymbols" })

			vim.keymap.set("n", "<leader>ws", builtin.lsp_dynamic_workspace_symbols, { desc = "[W]orkspace [S]ymbols" })

			vim.keymap.set("n", "rn", vim.lsp.buf.rename, { desc = "[R]e[n]ame" })

			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ction" })

			vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })

			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "[G]oto [D]eclaration" })

			vim.keymap.set("n", "<leader>/", function()
				builtin.current_buffer_fuzzy_find({
					winblend = 1,
					previewer = true,
				})
			end, { desc = "[/] Fuzzily search in current buffer" })

			vim.keymap.set("n", "<leader>s/", function()
				builtin.live_grep({
					grep_open_files = true,
					prompt_title = "Live Grep in Open Files",
				})
			end, { desc = "[S]earch [/] in Open Files" })

			vim.keymap.set("n", "<leader>cf", function()
				builtin.fd({ cwd = vim.fn.stdpath("config") })
			end, { desc = "[S]earch [N]eovim files" })
		end,
	},
}
