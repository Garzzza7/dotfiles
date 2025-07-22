return {
	{
		"nvim-telescope/telescope.nvim",
		event = "VimEnter",
		branch = "0.1.x",
		dependencies = {
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release -DCMAKE_POLICY_VERSION_MINIMUM=3.5 && cmake --build build --config Release && cmake --install build --prefix build",
			},
			{ "nvim-lua/popup.nvim" },
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope-ui-select.nvim" },
			{ "nvim-telescope/telescope-media-files.nvim" },
			{ "nvim-telescope/telescope-file-browser.nvim" },
			{
				"nvim-telescope/telescope-live-grep-args.nvim",
				version = "^1.0.0",
			},
			{
				"mrloop/telescope-git-branch.nvim",
			},
		},
		config = function()
			require("telescope").setup({
				defaults = {
					layout_strategy = "vertical",
					-- layout_strategy = "flex",
					sorting_strategy = "descending",
					layout_config = {
						prompt_position = "bottom",
						horizontal = {
							mirror = false,
							preview_cutoff = 100,
							preview_width = 0.5,
						},
						vertical = {
							mirror = false,
							preview_cutoff = 0.4,
						},
						flex = {
							flip_columns = 200,
						},

						height = 0.99,
						width = 0.99,
						preview_cutoff = 100,
					},
					mappings = {
						i = {
							["<ESC>"] = require("telescope.actions").close,
						},
					},
					preview = {
						filesize_limit = 1.0, -- MB
					},
				},
				pickers = {
					help_tags = {
						layout_strategy = "vertical",
						layout_config = { height = 0.99, width = 0.99 },
					},

					keymaps = {
						layout_strategy = "vertical",
						layout_config = { height = 0.99, width = 0.99 },
					},

					fd = {
						layout_strategy = "vertical",
						layout_config = { height = 0.99, width = 0.99 },
					},

					builtin = {
						layout_strategy = "vertical",
						layout_config = { height = 0.99, width = 0.99 },
					},

					grep_string = {
						layout_strategy = "vertical",
						layout_config = { height = 0.99, width = 0.99 },
					},

					live_grep = {
						layout_strategy = "vertical",
						layout_config = { height = 0.99, width = 0.99 },
					},

					diagnostics = {
						layout_strategy = "vertical",
						layout_config = { height = 0.99, width = 0.99 },
					},

					resume = {
						layout_strategy = "vertical",
						layout_config = { height = 0.99, width = 0.99 },
					},

					oldfiles = {
						layout_strategy = "vertical",
						layout_config = { height = 0.99, width = 0.99 },
					},

					buffers = {
						layout_strategy = "vertical",
						layout_config = { height = 0.99, width = 0.99 },
					},

					man_pages = {
						layout_strategy = "vertical",
						layout_config = { height = 0.99, width = 0.99 },
					},

					colorscheme = {
						layout_strategy = "vertical",
						layout_config = { height = 0.99, width = 0.99 },
					},

					marks = {
						layout_strategy = "vertical",
						layout_config = { height = 0.99, width = 0.99 },
					},

					git_status = {
						layout_strategy = "vertical",
						layout_config = { height = 0.99, width = 0.99 },
					},

					git_files = {
						layout_strategy = "vertical",
						layout_config = { height = -1.95, width = 0.99 },
					},

					current_buffer_fuzzy_find = {
						layout_strategy = "vertical",
						layout_config = { height = 0.99, width = 0.99 },
					},
				},
				extensions = {
					media_files = {
						-- filetypes whitelist
						-- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
						filetypes = { "pdf", "png", "webp", "jpg", "jpeg" },
						-- find command (defaults to `fd`)
						find_cmd = "rg",
					},
					file_browser = {
						path = vim.loop.cwd(),
						cwd = vim.loop.cwd(),
						cwd_to_path = false,
						grouped = false,
						files = true,
						add_dirs = true,
						depth = 1,
						auto_depth = false,
						select_buffer = false,
						hidden = { file_browser = false, folder_browser = false },
						respect_gitignore = vim.fn.executable("fd") == 1,
						no_ignore = false,
						follow_symlinks = false,
						browse_files = require("telescope._extensions.file_browser.finders").browse_files,
						browse_folders = require("telescope._extensions.file_browser.finders").browse_folders,
						hide_parent_dir = false,
						collapse_dirs = false,
						prompt_path = false,
						quiet = false,
						dir_icon = "",
						dir_icon_hl = "Default",
						display_stat = { date = true, size = true, mode = true },
						hijack_netrw = false,
						use_fd = true,
						git_status = true,
						mappings = {
							["i"] = {
								["<A-c>"] = require("telescope._extensions.file_browser.actions").create,
								["<S-CR>"] = require("telescope._extensions.file_browser.actions").create_from_prompt,
								["<A-r>"] = require("telescope._extensions.file_browser.actions").rename,
								["<A-m>"] = require("telescope._extensions.file_browser.actions").move,
								["<A-y>"] = require("telescope._extensions.file_browser.actions").copy,
								["<A-d>"] = require("telescope._extensions.file_browser.actions").remove,
								["<C-o>"] = require("telescope._extensions.file_browser.actions").open,
								["<C-g>"] = require("telescope._extensions.file_browser.actions").goto_parent_dir,
								["<C-e>"] = require("telescope._extensions.file_browser.actions").goto_home_dir,
								["<C-w>"] = require("telescope._extensions.file_browser.actions").goto_cwd,
								["<C-t>"] = require("telescope._extensions.file_browser.actions").change_cwd,
								["<C-f>"] = require("telescope._extensions.file_browser.actions").toggle_browser,
								["<C-h>"] = require("telescope._extensions.file_browser.actions").toggle_hidden,
								["<C-s>"] = require("telescope._extensions.file_browser.actions").toggle_all,
								["<bs>"] = require("telescope._extensions.file_browser.actions").backspace,
							},
							["n"] = {
								["c"] = require("telescope._extensions.file_browser.actions").create,
								["r"] = require("telescope._extensions.file_browser.actions").rename,
								["m"] = require("telescope._extensions.file_browser.actions").move,
								["y"] = require("telescope._extensions.file_browser.actions").copy,
								["d"] = require("telescope._extensions.file_browser.actions").remove,
								["o"] = require("telescope._extensions.file_browser.actions").open,
								["g"] = require("telescope._extensions.file_browser.actions").goto_parent_dir,
								["e"] = require("telescope._extensions.file_browser.actions").goto_home_dir,
								["w"] = require("telescope._extensions.file_browser.actions").goto_cwd,
								["t"] = require("telescope._extensions.file_browser.actions").change_cwd,
								["f"] = require("telescope._extensions.file_browser.actions").toggle_browser,
								["h"] = require("telescope._extensions.file_browser.actions").toggle_hidden,
								["s"] = require("telescope._extensions.file_browser.actions").toggle_all,
							},
						},
					},
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
					live_grep_args = {
						auto_quoting = true, -- enable/disable auto-quoting
						-- define mappings, e.g.
						mappings = { -- extend mappings
							i = {
								["<C-k>"] = require("telescope-live-grep-args.actions").quote_prompt(),
								["<C-i>"] = require("telescope-live-grep-args.actions").quote_prompt({
									postfix = " --iglob ",
								}),
								-- freeze the current list and start a fuzzy search in the frozen list
								["<C-space>"] = require("telescope-live-grep-args.actions").to_fuzzy_refine,
							},
						},
						-- ... also accepts theme settings, for example:
						-- theme = "dropdown", -- use dropdown theme
						-- theme = { }, -- use own theme spec
						-- layout_config = { mirror=true }, -- mirror preview pane
					},
				},
			})
			-- MAYBE USE PCAL IDK
			require("telescope").load_extension("fzf")
			require("telescope").load_extension("ui-select")
			require("telescope").load_extension("media_files")
			require("telescope").load_extension("file_browser")
			require("telescope").load_extension("live_grep_args")
			require("telescope").load_extension("git_branch")

			vim.keymap.set(
				"n",
				"<leader>gb",
				"<cmd>Telescope git_branch<cr>",
				{ noremap = true, silent = true, desc = "Use Telescope to open git_branch" }
			)

			vim.keymap.set(
				"n",
				"<leader>sga",
				"<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>",
				{ noremap = true, silent = true, desc = "Pass args to grep" }
			)

			vim.keymap.set(
				"n",
				"<leader>fb",
				"<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>",
				{ noremap = true, silent = true, desc = "File Browser relative to the buffer" }
			)

			vim.keymap.set(
				"n",
				"<leader>sh",
				require("telescope.builtin").help_tags,
				{ noremap = true, silent = true, desc = "[S]earch [H]elp" }
			)

			vim.keymap.set(
				"n",
				"<leader>sk",
				require("telescope.builtin").keymaps,
				{ noremap = true, silent = true, desc = "[S]earch [K]eymaps" }
			)

			vim.keymap.set(
				"n",
				"<leader>sf",
				require("telescope.builtin").fd,
				{ noremap = true, silent = true, desc = "[S]earch [F]iles" }
			)

			vim.keymap.set(
				"n",
				"<leader>ss",
				require("telescope.builtin").builtin,
				{ noremap = true, silent = true, desc = "[S]earch [S]elect Telescope" }
			)

			vim.keymap.set(
				"n",
				"<leader>sw",
				require("telescope.builtin").grep_string,
				{ noremap = true, silent = true, desc = "[S]earch current [W]ord" }
			)

			vim.keymap.set(
				"n",
				"<leader>sgg",
				require("telescope.builtin").live_grep,
				{ noremap = true, silent = true, desc = "[S]earch by [G]rep" }
			)

			vim.keymap.set(
				"n",
				"<leader>sd",
				require("telescope.builtin").diagnostics,
				{ noremap = true, silent = true, desc = "[S]earch [D]iagnostics" }
			)

			vim.keymap.set(
				"n",
				"<leader>sr",
				require("telescope.builtin").resume,
				{ noremap = true, silent = true, desc = "[S]earch [R]esume" }
			)

			vim.keymap.set(
				"n",
				"<leader>s.",
				require("telescope.builtin").oldfiles,
				{ noremap = true, silent = true, desc = '[S]earch Recent Files ("." for repeat)' }
			)

			vim.keymap.set(
				"n",
				"<leader><leader>",
				require("telescope.builtin").buffers,
				{ noremap = true, silent = true, desc = "Display existing buffers" }
			)

			vim.keymap.set(
				"n",
				"<leader>ma",
				require("telescope.builtin").man_pages,
				{ noremap = true, silent = true, desc = "Display manpages" }
			)

			vim.keymap.set(
				"n",
				"<leader>col",
				require("telescope.builtin").colorscheme,
				{ noremap = true, silent = true, desc = "Display colorschemes" }
			)

			vim.keymap.set(
				"n",
				"<leader>mn",
				require("telescope.builtin").marks,
				{ noremap = true, silent = true, desc = "Display marks" }
			)

			vim.keymap.set(
				"n",
				"<leader>gs",
				require("telescope.builtin").git_status,
				{ noremap = true, silent = true, desc = "Display git status" }
			)

			vim.keymap.set(
				"n",
				"<leader>sgf",
				require("telescope.builtin").git_files,
				{ noremap = true, silent = true, desc = "Search git files" }
			)

			vim.keymap.set(
				"n",
				"gd",
				require("telescope.builtin").lsp_definitions,
				{ noremap = true, silent = true, desc = "[G]oto [D]efinition" }
			)

			vim.keymap.set(
				"n",
				"gr",
				require("telescope.builtin").lsp_references,
				{ noremap = true, silent = true, desc = "[G]oto [R]eferences" }
			)

			vim.keymap.set(
				"n",
				"gi",
				require("telescope.builtin").lsp_implementations,
				{ noremap = true, silent = true, desc = "[G]oto [I]mplementation" }
			)

			vim.keymap.set(
				"n",
				"<leader>ds",
				require("telescope.builtin").lsp_document_symbols,
				{ noremap = true, silent = true, desc = "[D]ocument [S]ymbols" }
			)

			vim.keymap.set(
				"n",
				"<leader>ws",
				require("telescope.builtin").lsp_dynamic_workspace_symbols,
				{ noremap = true, silent = true, desc = "[W]orkspace [S]ymbols" }
			)

			vim.keymap.set("n", "rn", vim.lsp.buf.rename, { noremap = true, silent = true, desc = "[R]e[n]ame" })

			vim.keymap.set(
				"n",
				"<leader>ca",
				vim.lsp.buf.code_action,
				{ noremap = true, silent = true, desc = "[C]ode [A]ction" }
			)

			vim.keymap.set("n", "K", vim.lsp.buf.hover, { noremap = true, silent = true, desc = "Hover Documentation" })

			vim.keymap.set(
				"n",
				"gD",
				vim.lsp.buf.declaration,
				{ noremap = true, silent = true, desc = "[G]oto [D]eclaration" }
			)

			vim.keymap.set("n", "<leader>/", function()
				require("telescope.builtin").current_buffer_fuzzy_find({
					winblend = 1,
					previewer = true,
				})
			end, { noremap = true, silent = true, desc = "[/] Fuzzily search in current buffer" })

			vim.keymap.set("n", "<leader>s/", function()
				require("telescope.builtin").live_grep({
					grep_open_files = true,
					prompt_title = "Live Grep in Open Files",
				})
			end, { noremap = true, silent = true, desc = "[S]earch [/] in Open Files" })

			vim.keymap.set("n", "<leader>cf", function()
				require("telescope.builtin").fd({ cwd = vim.fn.stdpath("config") })
			end, { noremap = true, silent = true, desc = "[S]earch [N]eovim files" })
		end,
	},
}
