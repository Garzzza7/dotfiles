vim.g.netrw_liststyle = 3

vim.g.netrw_sort_by = "mtime"

vim.g.netrw_banner = 0

vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.showmode = false
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 150
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.listchars = { tab = "> ", trail = "_", nbsp = "␣" }
vim.opt.inccommand = "split"
vim.opt.cursorline = true
vim.opt.scrolloff = 10
--syncronizing clipboard between neovim and the system, in order for this to work xclip has to be installed
vim.opt.clipboard:append({ "unnamed", "unnamedplus" })

vim.opt.hlsearch = true
vim.o.background = "dark"
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{ "tpope/vim-sleuth" }, -- NICE TABS DONT DELETE!!!!
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
	},

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
				defaults = {},
				pickers = {
					find_files = {
						theme = "ivy",
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
			vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
			vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
			vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
			vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
			vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
			vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
			vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
			vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })

			vim.keymap.set("n", "<leader>/", function()
				builtin.current_buffer_fuzzy_find(require("telescope.themes").get_ivy({
					winblend = 10,
					previewer = true,
				}))
			end, { desc = "[/] Fuzzily search in current buffer" })

			vim.keymap.set("n", "<leader>s/", function()
				builtin.live_grep({
					grep_open_files = true,
					prompt_title = "Live Grep in Open Files",
				})
			end, { desc = "[S]earch [/] in Open Files" })

			vim.keymap.set("n", "<leader>cf", function()
				builtin.find_files({ cwd = vim.fn.stdpath("config") })
			end, { desc = "[S]earch [N]eovim files" })
		end,
	},

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			{ "j-hui/fidget.nvim", opts = {} },
			{ "folke/neodev.nvim", opts = {} },
		},
		config = function()
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
				callback = function(event)
					local map = function(keys, func, desc)
						vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end

					map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")

					map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")

					map("gi", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")

					map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")

					map(
						"<leader>ws",
						require("telescope.builtin").lsp_dynamic_workspace_symbols,
						"[W]orkspace [S]ymbols"
					)
					map("rn", vim.lsp.buf.rename, "[R]e[n]ame")

					map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

					map("dc", vim.lsp.buf.hover, "Hover Documentation")

					map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

					local client = vim.lsp.get_client_by_id(event.data.client_id)
					if client and client.server_capabilities.documentHighlightProvider then
						vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
							buffer = event.buf,
							callback = vim.lsp.buf.document_highlight,
						})

						vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
							buffer = event.buf,
							callback = vim.lsp.buf.clear_references,
						})
					end
				end,
			})
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

			local servers = {
				clangd = {},
				pyright = {},
				rust_analyzer = {},
				bashls = {},
				neocmake = {},
				asm_lsp = {},
				-- gopls = {},
				glsl_analyzer = {},
				hls = {},
				ocamllsp = {},
				ocamlformat = {},
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

			require("mason").setup()

			local ensure_installed = vim.tbl_keys(servers or {})
			vim.list_extend(ensure_installed, {
				"stylua",
				"black",
			})
			require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

			require("mason-lspconfig").setup({
				handlers = {
					function(server_name)
						local server = servers[server_name] or {}
						server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
						require("lspconfig")[server_name].setup(server)
					end,
				},
			})
		end,
	},

	{
		"stevearc/conform.nvim",
		lazy = true,
		keys = {
			{
				"==",
				function()
					require("conform").format({ async = true, lsp_fallback = true })
				end,
				mode = "",
				desc = "Format buffer",
			},
		},
		opts = {
			notify_on_error = false,
			format_on_save = function(bufnr)
				local disable_filetypes = {}
				return {
					timeout_ms = 500,
					lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
				}
			end,
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "black" },
			},
		},
	},

	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			{
				"L3MON4D3/LuaSnip",
				build = (function()
					if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
						return
					end
					return "make install_jsregexp"
				end)(),
				dependencies = {},
			},
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			luasnip.config.setup({})

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				completion = { completeopt = "menu,menuone,noinsert" },
				mapping = cmp.mapping.preset.insert({
					["<C-n>"] = cmp.mapping.select_next_item(),
					["<C-p>"] = cmp.mapping.select_prev_item(),

					["<C-k>"] = cmp.mapping.scroll_docs(-4),
					["<C-j>"] = cmp.mapping.scroll_docs(4),

					["<C-Enter>"] = cmp.mapping.confirm({ select = true }),

					["<C-Space>"] = cmp.mapping.complete({}),

					["<C-l>"] = cmp.mapping(function()
						if luasnip.expand_or_locally_jumpable() then
							luasnip.expand_or_jump()
						end
					end, { "i", "s" }),
					["<C-h>"] = cmp.mapping(function()
						if luasnip.locally_jumpable(-1) then
							luasnip.jump(-1)
						end
					end, { "i", "s" }),
				}),
				sources = {
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "path" },
				},
			})
		end,
	},
	-- {
	-- 	"catppuccin/nvim",
	-- 	name = "catppuccin",
	-- 	priority = 1000,
	-- 	init = function()
	-- 		local function_names = ""
	-- 		local line_following_the_cursor = ""
	-- 		local line_numbers = ""
	-- 		local parenthesis = ""
	-- 		local variables = ""
	-- 		local strings = ""
	-- 		local symbols_and_atoms = ""
	-- 		local types = ""
	-- 		local preprocessor_defines = ""
	-- 		local numbers = ""
	-- 		local macro_parameters = ""
	-- 		local namespaces = ""
	-- 		local idk = ""
	-- 		local latte = require("catppuccin.palettes").get_palette("latte")
	-- 		local frappe = require("catppuccin.palettes").get_palette("frappe")
	-- 		local macchiato = require("catppuccin.palettes").get_palette("macchiato")
	-- 		local mocha = require("catppuccin.palettes").get_palette("mocha")
	-- 		local light = "#000000"
	-- 		local black = "#ffffff"
	-- 		require("catppuccin").setup({
	-- 			flavour = "auto", -- latte, frappe, macchiato, mocha
	-- 			background = { -- :h background
	-- 				light = "latte",
	-- 				dark = "mocha",
	-- 			},
	-- 			transparent_background = false, -- disables setting the background color.
	-- 			show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
	-- 			term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
	-- 			dim_inactive = {
	-- 				enabled = false, -- dims the background color of inactive window
	-- 				shade = "dark",
	-- 				percentage = 0.15, -- percentage of the shade to apply to the inactive window
	-- 			},
	-- 			no_italic = false, -- Force no italic
	-- 			no_bold = false, -- Force no bold
	-- 			no_underline = false, -- Force no underline
	-- 			styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
	-- 				comments = { "italic" }, -- Change the style of comments
	-- 				conditionals = { "italic" },
	-- 				loops = {},
	-- 				functions = {},
	-- 				keywords = {},
	-- 				strings = {},
	-- 				variables = {},
	-- 				numbers = {},
	-- 				booleans = {},
	-- 				properties = {},
	-- 				types = {},
	-- 				operators = {},
	-- 			},
	-- 			color_overrides = {
	-- 				all = {
	-- 					--background
	-- 					base = "#eeeeee",
	-- 					--bottom bar and popups
	-- 					mantle = "#cce5ff",
	-- 					crust = "#cce5ff",
	-- 					--line following the cursor
	-- 					surface0 = black,
	-- 					--line numbers
	-- 					surface1 = "#4b4b4b",
	-- 					--idk
	-- 					surface2 = "#ff0000",
	-- 					--comments
	-- 					overlay0 = "#8a8a8a",
	-- 					--errors like in cmake or maybe not
	-- 					overlay1 = "#ff0000",
	-- 					--parenthesis
	-- 					overlay2 = light,
	-- 					--variables
	-- 					text = light,
	-- 					--idk
	-- 					subtext0 = "#ff0000",
	-- 					--idk
	-- 					subtext1 = "#ff0000",
	-- 					--funtion names
	-- 					blue = "#000066",
	-- 					--strings
	-- 					green = "#3333ff",
	-- 					--symbols , atoms etc cin
	-- 					red = light,
	-- 					--types
	-- 					yellow = "#000099",
	-- 					--#define etc
	-- 					pink = light,
	-- 					--numbers
	-- 					peach = "#003366",
	-- 					--marco parameters
	-- 					maroon = light,
	-- 					--idk
	-- 					teal = "#ff0000",
	-- 					--namespaces etc
	-- 					lavender = light,
	-- 					--idk
	-- 					rosewater = "#ff0000",
	-- 					--idk
	-- 					sapphire = "#ff0000",
	-- 					mauve = "#4c0099",
	-- 					--idk
	-- 					sky = "#000099",
	-- 					--https://github.com/catppuccin/catppuccin/blob/main/docs/style-guide.md
	-- 				},
	-- 			},
	-- 			custom_highlights = {},
	-- 			default_integrations = true,
	-- 			integrations = {
	-- 				cmp = true,
	-- 				nvimtree = true,
	-- 				treesitter = true,
	-- 			},
	-- 		})
	--
	-- 		-- setup must be called before loading
	-- 		vim.cmd.colorscheme("catppuccin")
	-- 	end,
	-- },
	-- {
	-- 	"EdenEast/nightfox.nvim",
	-- 	init = function()
	-- 		local palettes = {
	-- 			all = {
	-- 				bg0 = "#000000",
	-- 				comment = "#666666",
	-- 			},
	-- 		}
	-- 		local specs = {
	-- 			-- As with palettes, the values defined under `all` will be applied to every style.
	-- 			all = {
	-- 				syntax = {
	-- 					comments = "#1111111",
	-- 					conditionals = "#1111111",
	-- 					constants = "#1111111",
	-- 					functions = "#1111111",
	-- 					keywords = "#1111111",
	-- 					numbers = "#1111111",
	-- 					operators = "#1111111",
	-- 					strings = "#1111111",
	-- 					types = "#1111111",
	-- 					variables = "#1111111",
	-- 				},
	-- 				git = {
	-- 					changed = "#f4a261",
	-- 				},
	-- 			},
	-- 		}
	-- 		local groups = {
	-- 			-- As with specs and palettes, the values defined under `all` will be applied to every style.
	-- 			all = {
	-- 				-- If `link` is defined it will be applied over any other values defined
	-- 				Whitespace = { link = "Comment" },
	--
	-- 				-- Specs are used for the template. Specs have their palette's as a field that can be accessed
	-- 				IncSearch = { bg = "palette.cyan" },
	-- 			},
	-- 			nightfox = {
	-- 				-- As with specs and palettes, a specific style's value will be used over the `all`'s value.
	-- 				PmenuSel = { bg = "#73daca", fg = "bg0" },
	-- 			},
	-- 		}
	--
	-- 		--require("nightfox").setup({ palettes = palettes, specs = specs, groups = groups })
	-- 		require("nightfox").setup({})
	--
	-- 		-- require("nightfox").setup({ palettes = palettes, specs = specs, groups = groups })({
	-- 		-- 	options = {
	-- 		-- 		-- Compiled file's destination location
	-- 		-- 		compile_path = vim.fn.stdpath("cache") .. "/nightfox",
	-- 		-- 		compile_file_suffix = "_compiled", -- Compiled file suffix
	-- 		-- 		transparent = false, -- Disable setting background
	-- 		-- 		terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
	-- 		-- 		dim_inactive = false, -- Non focused panes set to alternative background
	-- 		-- 		module_default = true, -- Default enable value for modules
	-- 		-- 		colorblind = {
	-- 		-- 			enable = false, -- Enable colorblind support
	-- 		-- 			simulate_only = false, -- Only show simulated colorblind colors and not diff shifted
	-- 		-- 			severity = {
	-- 		-- 				protan = 0, -- Severity [0,1] for protan (red)
	-- 		-- 				deutan = 0, -- Severity [0,1] for deutan (green)
	-- 		-- 				tritan = 0, -- Severity [0,1] for tritan (blue)
	-- 		-- 			},
	-- 		-- 		},
	-- 		-- 		styles = { -- Style to be applied to different syntax groups
	-- 		-- 			comments = "italic", -- Value is any valid attr-list value `:help attr-list`
	-- 		-- 			conditionals = "NONE",
	-- 		-- 			constants = "bold",
	-- 		-- 			functions = "NONE",
	-- 		-- 			keywords = "NONE",
	-- 		-- 			numbers = "NONE",
	-- 		-- 			operators = "NONE",
	-- 		-- 			strings = "NONE",
	-- 		-- 			types = "italic,bold",
	-- 		-- 			variables = "NONE",
	-- 		-- 		},
	-- 		-- 		inverse = { -- Inverse highlight for different types
	-- 		-- 			match_paren = false,
	-- 		-- 			visual = false,
	-- 		-- 			search = false,
	-- 		-- 		},
	-- 		-- 		modules = { -- List of various plugins and additional options
	-- 		-- 			-- ...
	-- 		-- 		},
	-- 		-- 	},
	-- 		-- })
	--
	-- 		-- setup must be called before loading
	-- 		vim.cmd("colorscheme dayfox")
	-- 	end,
	-- },
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		config = true,
		init = function()
			require("gruvbox").setup({
				terminal_colors = true, -- add neovim terminal colors
				undercurl = true,
				underline = true,
				bold = true,
				italic = {
					strings = false,
					emphasis = false,
					comments = false,
					operators = false,
					folds = false,
				},
				strikethrough = true,
				invert_selection = false,
				invert_signs = false,
				invert_tabline = false,
				invert_intend_guides = false,
				inverse = true, -- invert background for search, diffs, statuslines and errors
				contrast = "hard", -- can be "hard", "soft" or empty string
				palette_overrides = {},
				overrides = {},
				dim_inactive = false,
				transparent_mode = false,
			})
			-- vim.o.background = "dark"
			vim.cmd("colorscheme gruvbox")
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opts = {
			ensure_installed = {
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
	{
		"kdheepak/lazygit.nvim",
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		-- setting the keybinding for LazyGit with 'keys' is recommended in
		-- order to load the plugin when the command is run for the first time
		keys = {
			{ "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
		},
	},
	{
		{
			"akinsho/toggleterm.nvim",
			version = "*",
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
	{
		"ej-shafran/compile-mode.nvim",
		-- HARDCODED TAG , CHECK REPO FOR NEWEST
		tag = "v5.2.0",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "m00qek/baleia.nvim", tag = "v1.3.0" },
		},
		config = function()
			---@type CompileModeOpts
			vim.g.compile_mode = {
				baleia_setup = true,
			}
		end,
	},
}, {})
