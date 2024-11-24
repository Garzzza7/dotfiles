return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		lazy = false,
		init = function()
			local function_names = ""
			local line_following_the_cursor = ""
			local line_numbers = ""
			local parenthesis = ""
			local variables = ""
			local strings = ""
			local symbols_and_atoms = ""
			local types = ""
			local preprocessor_defines = ""
			local numbers = ""
			local macro_parameters = ""
			local namespaces = ""
			local idk = ""
			local latte = require("catppuccin.palettes").get_palette("latte")
			local frappe = require("catppuccin.palettes").get_palette("frappe")
			local macchiato = require("catppuccin.palettes").get_palette("macchiato")
			local mocha = require("catppuccin.palettes").get_palette("mocha")
			local light = "#000000"
			local black = "#ffffff"
			require("catppuccin").setup({
				flavour = "latte", -- latte, frappe, macchiato, mocha
				background = { -- :h background
					-- light = "latte",
					dark = "latte",
				},
				transparent_background = false, -- disables setting the background color.
				show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
				term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
				dim_inactive = {
					enabled = false, -- dims the background color of inactive window
					shade = "dark",
					percentage = 0.15, -- percentage of the shade to apply to the inactive window
				},
				no_italic = false, -- Force no italic
				no_bold = false, -- Force no bold
				no_underline = false, -- Force no underline
				styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
					comments = { "italic" }, -- Change the style of comments
					conditionals = { "italic" },
					loops = {},
					functions = {},
					keywords = {},
					strings = {},
					variables = {},
					numbers = {},
					booleans = {},
					properties = {},
					types = {},
					operators = {},
				},
				color_overrides = {
					all = {
						--background
						base = "#eeeeee",
						--bottom bar and popups
						mantle = "#cce5ff",
						crust = "#cce5ff",
						--line following the cursor
						surface0 = black,
						--line numbers
						surface1 = "#4b4b4b",
						--idk
						surface2 = "#ff0000",
						--comments
						overlay0 = "#8a8a8a",
						--errors like in cmake or maybe not
						overlay1 = "#ff0000",
						--parenthesis
						overlay2 = light,
						--variables
						text = light,
						--idk
						subtext0 = "#ff0000",
						--idk
						subtext1 = "#ff0000",
						--funtion names
						blue = "#000066",
						--strings
						green = "#3333ff",
						--symbols , atoms etc cin
						red = light,
						--types
						yellow = "#000099",
						--#define etc
						pink = light,
						--numbers
						peach = "#003366",
						--marco parameters
						maroon = light,
						--idk
						teal = "#ff0000",
						--namespaces etc
						lavender = light,
						--idk
						rosewater = "#ff0000",
						--idk
						sapphire = "#ff0000",
						mauve = "#4c0099",
						--idk
						sky = "#000099",
						--https://github.com/catppuccin/catppuccin/blob/main/docs/style-guide.md
					},
				},
				custom_highlights = {},
				default_integrations = true,
				integrations = {
					cmp = true,
					nvimtree = true,
					treesitter = true,
					mason = true,
				},
			})
		end,
	},
	{
		"EdenEast/nightfox.nvim",
		lazy = false,
		init = function()
			local palettes = {
				all = {
					bg0 = "#000000",
					comment = "#666666",
				},
			}
			local specs = {
				-- As with palettes, the values defined under `all` will be applied to every style.
				all = {
					syntax = {
						comments = "#1111111",
						conditionals = "#1111111",
						constants = "#1111111",
						functions = "#1111111",
						keywords = "#1111111",
						numbers = "#1111111",
						operators = "#1111111",
						strings = "#1111111",
						types = "#1111111",
						variables = "#1111111",
					},
					git = {
						changed = "#f4a261",
					},
				},
			}
			local groups = {
				-- As with specs and palettes, the values defined under `all` will be applied to every style.
				all = {
					-- If `link` is defined it will be applied over any other values defined
					Whitespace = { link = "Comment" },

					-- Specs are used for the template. Specs have their palette's as a field that can be accessed
					IncSearch = { bg = "palette.cyan" },
				},
				nightfox = {
					-- As with specs and palettes, a specific style's value will be used over the `all`'s value.
					PmenuSel = { bg = "#73daca", fg = "bg0" },
				},
			}

			--require("nightfox").setup({ palettes = palettes, specs = specs, groups = groups })
			require("nightfox").setup({})

			-- require("nightfox").setup({ palettes = palettes, specs = specs, groups = groups })({
			-- 	options = {
			-- 		-- Compiled file's destination location
			-- 		compile_path = vim.fn.stdpath("cache") .. "/nightfox",
			-- 		compile_file_suffix = "_compiled", -- Compiled file suffix
			-- 		transparent = false, -- Disable setting background
			-- 		terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
			-- 		dim_inactive = false, -- Non focused panes set to alternative background
			-- 		module_default = true, -- Default enable value for modules
			-- 		colorblind = {
			-- 			enable = false, -- Enable colorblind support
			-- 			simulate_only = false, -- Only show simulated colorblind colors and not diff shifted
			-- 			severity = {
			-- 				protan = 0, -- Severity [0,1] for protan (red)
			-- 				deutan = 0, -- Severity [0,1] for deutan (green)
			-- 				tritan = 0, -- Severity [0,1] for tritan (blue)
			-- 			},
			-- 		},
			-- 		styles = { -- Style to be applied to different syntax groups
			-- 			comments = "italic", -- Value is any valid attr-list value `:help attr-list`
			-- 			conditionals = "NONE",
			-- 			constants = "bold",
			-- 			functions = "NONE",
			-- 			keywords = "NONE",
			-- 			numbers = "NONE",
			-- 			operators = "NONE",
			-- 			strings = "NONE",
			-- 			types = "italic,bold",
			-- 			variables = "NONE",
			-- 		},
			-- 		inverse = { -- Inverse highlight for different types
			-- 			match_paren = false,
			-- 			visual = false,
			-- 			search = false,
			-- 		},
			-- 		modules = { -- List of various plugins and additional options
			-- 			-- ...
			-- 		},
			-- 	},
			-- })
		end,
	},
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		config = true,
		lazy = false,
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
				contrast = "", -- can be "hard", "soft" or empty string
				palette_overrides = {},
				overrides = {},
				dim_inactive = false,
				transparent_mode = false,
			})
			-- vim.o.background = "dark"
		end,
	},
	{
		"neanias/everforest-nvim",
		version = false,
		lazy = false,
		priority = 1000,
		config = function()
			require("everforest").setup({
				on_highlights = function(hl, palette)
					hl.DiagnosticError = { fg = palette.none, bg = palette.none, sp = palette.red }
					hl.DiagnosticWarn = { fg = palette.none, bg = palette.none, sp = palette.yellow }
					hl.DiagnosticInfo = { fg = palette.none, bg = palette.none, sp = palette.blue }
					hl.DiagnosticHint = { fg = palette.none, bg = palette.none, sp = palette.green }
					hl.TSBoolean = { fg = palette.purple, bg = palette.none, bold = true }
				end,
				colours_override = function(palette) end,
			})
		end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{
		"Tsuzat/NeoSolarized.nvim",
		lazy = false,
		priority = 1000,
	},
	{
		"scottmckendry/cyberdream.nvim",
		lazy = false,
		priority = 1000,
	},
	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		priority = 1000,
	},
}
