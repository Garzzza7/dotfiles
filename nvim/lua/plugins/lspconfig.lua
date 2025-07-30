return {
	{
		"neovim/nvim-lspconfig",
		version = "v2.1.0",
		dependencies = {
			{
				"williamboman/mason.nvim",
				version = "v1.11.0",
			},
			{
				"williamboman/mason-lspconfig.nvim",
				version = "v1.32.0",
			},
			{
				"WhoIsSethDaniel/mason-tool-installer.nvim",
			},
			{
				"j-hui/fidget.nvim",
				version = "v1.6.1",
				opts = {},
				init = function ()
					require ("fidget").setup ({
						-- Options related to LSP progress subsystem
						progress = {
							poll_rate = 0, -- How and when to poll for progress messages
							suppress_on_insert = false, -- Suppress new messages while in insert mode
							ignore_done_already = false, -- Ignore new tasks that are already complete
							ignore_empty_message = false, -- Ignore new tasks that don't contain a message
							-- Clear notification group when LSP server detaches
							clear_on_detach = function (client_id)
								local client = vim.lsp.get_client_by_id (client_id)
								return client and client.name or nil
							end,
							-- How to get a progress message's notification group key
							notification_group = function (msg)
								return string.format ("%s %s", "Processing", msg.lsp_client.name)
							end,
							ignore = {}, -- List of LSP servers to ignore

							-- Options related to how LSP progress messages are displayed as notifications
							display = {
								render_limit = 15, -- How many LSP messages to show at once
								done_ttl = 3, -- How long a message should persist after completion
								done_icon = "✔", -- Icon shown when all LSP progress tasks are complete
								done_style = "Constant", -- Highlight group for completed LSP tasks
								progress_ttl = math.huge, -- How long a message should persist when in progress
								-- Icon shown when LSP progress tasks are in progress
								progress_icon = { pattern = "dots", period = 2 },
								-- Highlight group for in-progress LSP tasks
								progress_style = "WarningMsg",
								group_style = "Title", -- Highlight group for group name (LSP server name)
								icon_style = "Question", -- Highlight group for group icons
								priority = 30, -- Ordering priority for LSP notification group
								skip_history = true, -- Whether progress notifications should be omitted from history
								-- How to format a progress message
								format_message = require ("fidget.progress.display").default_format_message,
								-- How to format a progress annotation
								format_annote = function (msg)
									return string.format ("%s %s", msg.title, "lol")
								end,
								-- How to format a progress notification group's name
								format_group_name = function (lsp_name)
									return string.format ("%s", lsp_name)
								end,
								overrides = { -- Override options from the default notification config
								},
							},

							-- Options related to Neovim's built-in LSP client
							lsp = {
								progress_ringbuf_size = 0, -- Configure the nvim's LSP progress ring buffer size
								log_handler = false, -- Log `$/progress` handler invocations (for debugging)
							},
						},

						-- Options related to notification subsystem
						notification = {
							poll_rate = 10, -- How frequently to update and render notifications
							filter = vim.log.levels.INFO, -- Minimum notifications level
							history_size = 128, -- Number of removed messages to retain in history
							override_vim_notify = true, -- Automatically override vim.notify() with Fidget
							-- How to configure notification groups when instantiated
							configs = { default = require ("fidget.notification").default_config },
							-- Conditionally redirect notifications to another backend
							redirect = function (msg, level, opts)
								if opts and opts.on_open then
									return require ("fidget.integration.nvim-notify").delegate (msg, level, opts)
								end
							end,

							-- Options related to how notifications are rendered as text
							view = {
								stack_upwards = true, -- Display notification items from bottom to top
								icon_separator = " ", -- Separator between group name and icon
								group_separator = "---", -- Separator between notification groups
								-- Highlight group used for group separator
								group_separator_hl = "Comment",
								-- How to render notification messages
								render_message = function (msg, cnt)
									return cnt == 1 and msg or string.format ("(%dx) %s", cnt, "DONE")
								end,
							},

							-- Options related to the notification window and buffer
							window = {
								normal_hl = "Comment", -- Base highlight group in the notification window
								winblend = 50, -- Background color opacity in the notification window
								border = "none", -- Border around the notification window
								zindex = 45, -- Stacking priority of the notification window
								max_width = 100, -- Maximum width of the notification window
								max_height = 100, -- Maximum height of the notification window
								x_padding = 0, -- Padding from right edge of window boundary
								y_padding = 0, -- Padding from bottom edge of window boundary
								align = "top", -- How to align the notification window
								relative = "editor", -- What the notification window position is relative to
							},
						},

						-- Options related to integrating with other plugins
						integration = {},

						-- Options related to logging
						logger = {
							level = vim.log.levels.WARN, -- Minimum logging level
							max_size = 100, -- Maximum log file size, in KB
							float_precision = 0.01, -- Limit the number of decimals displayed for floats
							-- Where Fidget writes its logs to
							path = string.format ("%s/fidget.nvim.log", vim.fn.stdpath ("cache")),
						},
					})
				end,
			},
			{ "folke/neodev.nvim", opts = {} },
		},
		config = function ()
			vim.api.nvim_create_autocmd ("LspAttach", {
				group = vim.api.nvim_create_augroup ("lsp-attach", { clear = true }),
				callback = function (event)
					local client = vim.lsp.get_client_by_id (event.data.client_id)
					if client and client.server_capabilities.documentHighlightProvider then
						vim.api.nvim_create_autocmd ({ "CursorHold", "CursorHoldI" }, {
							buffer = event.buf,
							callback = vim.lsp.buf.document_highlight,
						})

						vim.api.nvim_create_autocmd ({ "CursorMoved", "CursorMovedI" }, {
							buffer = event.buf,
							callback = vim.lsp.buf.clear_references,
						})
					end
				end,
			})
			local capabilities = vim.lsp.protocol.make_client_capabilities ()
			capabilities = vim.tbl_deep_extend ("force", capabilities, require ("cmp_nvim_lsp").default_capabilities ())

			local servers = {
				clangd = {},
				pyright = {},
				rust_analyzer = {
					diagnostics = {
						enable = true,
					},
				},
				bashls = {},
				neocmake = {},
				tinymist = {},
				-- asm_lsp = {},
				-- asmfmt = {},
				-- gopls = {},
				glsl_analyzer = {},
				perlnavigator = {
					cmd = { "perlnavigator" },
					settings = {
						perlnavigator = {
							perlPath = "/usr/bin/perl",
							enableWarnings = true,
							perltidyProfile = "",
							perlcriticProfile = "",
							perlcriticEnabled = true,
						},
					},
				},
				-- html = {},
				-- hls = {},
				-- ocamllsp = {},
				vimls = {},
				lua_ls = {
					settings = {
						Lua = {
							completion = {
								callSnippet = "Replace",
							},
						},
					},
				},
			}

			require ("mason").setup ()

			local ensure_installed = vim.tbl_keys (servers or {})
			vim.list_extend (ensure_installed, {
				"stylua",
				"black",
				"clang-format",
				"shfmt",
				-- "beautysh",
				-- "ocamlformat",
			})
			require ("mason-tool-installer").setup ({ ensure_installed = ensure_installed })

			require ("mason-lspconfig").setup ({
				handlers = {
					function (server_name)
						local server = servers[server_name] or {}
						server.capabilities = vim.tbl_deep_extend ("force", {}, capabilities, server.capabilities or {})
						require ("lspconfig")[server_name].setup (server)
					end,
				},
			})

			-- https://mason-registry.dev/registry/list?search=

			-- local lspconfig = require("lspconfig")

			-- lspconfig.ocamllsp.setup({})
			-- https://github.com/ocaml/ocaml-lsp

			-- lspconfig.perlnavigator.setup({
			-- 	cmd = { "perlnavigator" },
			-- 	settings = {
			-- 		perlnavigator = {
			-- 			perlPath = "perl",
			-- 			enableWarnings = true,
			-- 			perltidyProfile = "",
			-- 			perlcriticProfile = "",
			-- 			perlcriticEnabled = true,
			-- 		},
			-- 	},
			-- })
			-- https://github.com/bscan/PerlNavigator

			-- lspconfig.opencl_ls.setup({})
			-- https://github.com/Galarius/opencl-language-server

			-- lspconfig.hls.setup({})
			-- https://haskell-language-server.readthedocs.io/en/latest/installation.html

			-- lspconfig.glsl_analyzer.setup({
			-- 	filetypes = {
			-- 		"glsl",
			-- 		"vert",
			-- 		"vs",
			-- 		"fs",
			-- 	},
			-- })
			-- https://github.com/nolanderc/glsl_analyzer

			-- lspconfig.vimls.setup({})
			-- https://github.com/iamcco/vim-language-server

			-- lspconfig.bashls.setup({})
			-- https://github.com/bash-lsp/bash-language-server

			-- lspconfig.rust_analyzer.setup({})
			-- https://rust-analyzer.github.io/manual.html

			-- lspconfig.pyright.setup({})

			-- lspconfig.clangd.setup({})
			-- https://clangd.llvm.org/installation.html

			-- lspconfig.lua_ls.setup({})
			-- https://luals.github.io/#install

			-- if not require("lspconfig.configs").neocmake then
			-- 	require("lspconfig.configs").neocmake = {
			-- 		default_config = {
			-- 			cmd = { "neocmakelsp", "--stdio" },
			-- 			filetypes = { "cmake" },
			-- 			root_dir = function(fname)
			-- 				return lspconfig.util.find_git_ancestor(fname)
			-- 			end,
			-- 			single_file_support = true, -- suggested
			-- 			on_attach = on_attach, -- on_attach is the on_attach function you defined
			-- 			init_options = {
			-- 				format = {
			-- 					enable = true,
			-- 				},
			-- 				lint = {
			-- 					enable = true,
			-- 				},
			-- 				scan_cmake_in_package = true, -- default is true
			-- 			},
			-- 		},
			-- 	}
			-- 	lspconfig.neocmake.setup({})
			-- end
			-- https://github.com/neocmakelsp/neocmakelsp?tab=readme-ov-file#installation
		end,
	},
}
