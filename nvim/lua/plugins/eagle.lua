return {
	{
		"soulis-1256/eagle.nvim",
		opts = {
			-- whether to show the markdown headers (# Diagnostics and # LSP Info)
			-- this is also controlled by the command :EagleWinToggleHeaders
			show_headers = true,

			-- the order of diagnostics (D) and lsp info (L)
			-- the order can vary based on if the window is rendered on the
			-- top half or bottom half of the screen (based on the mouse/cursor position in the view)
			-- there are 4 options (left of the slash is the top render, right of the slash is the bottom render):
			-- 1. DL/DL (the default, diagnostics have priority)
			-- 2. DL/LD (lsp info is always the closest to the mouse/cursor)
			-- 3. LD/LD (lsp info have priority)
			-- 4. LD/DL (diagnostics is always the closest to the mouse/cursor)
			order = 1,

			--see https://neovim.io/doc/user/options.html for both of these options
			--redundant when <improved_markdown> is disabled
			concealcursor = "nc",
			conceallevel = 3,

			--added an improved way to stylize markdown that is visually identical to vim.lsp.buf.hover()
			--disable if you encounter any issues
			improved_markdown = true,

			--mouse mode is the default mode for this plugin
			--disable if you want pure keyboard mode
			mouse_mode = true,

			--keyboard mode disables mouse control
			--set a custom keybind to use the plugin
			--you can disable vim.o.mousemoveevent if you enable this option
			--you can have both keyboard_mode and mouse_mode enabled at the same time
			keyboard_mode = false,

			--logging, runtime info
			--enable if the plugin isn't working as expected
			--and check with ':messages'
			logging = false,

			-- close the eagle window when you execute a command (pressing : on normal or visual mode)
			-- this is to avoid weird things happening when the eagle window is in focus
			-- set it to false if you want more control over the window
			close_on_cmd = true,

			--show lsp info (exact same contents as from vim.lsp.buf.hover()) in the eagle window
			show_lsp_info = true,

			--Offset that handles possible scrollbar plugins
			--by adding an offset column in the right side of the window.
			--If you don't know what I'm talking about, then
			--you don't need this option.
			scrollbar_offset = 0,

			--limit the width of the eagle window to the floor of vim.o.columns / max_width_factor
			--it should be any float number in the range [1.1, 5.0]
			--it falls back to 2.5 if you override outside the valid range
			max_width_factor = 2,

			--limit the height of the eagle window to the floor of vim.o.lines / max_height_factor
			--it should be any float number in the range [2.5, 5.0]
			--it falls back to 2.5 if you override outside the valid range
			max_height_factor = 2.5,

			--the delay between the mouse position arriving at a diagnostic
			--and the floating window opening (in milliseconds)
			--falls back to 500 if you override to something below 0
			render_delay = 500,

			--the timer before the mouse is considered idle (in milliseconds)
			--it falls back to 50 if you override to something below 0
			detect_idle_timer = 50,

			--offsets that can move the window in any direction
			--you can experiment with values and see what you like
			window_row = 1,
			window_col = 5,

			--window border options, from the api docs
			--"none": No border (default).
			--"single": A single line box.
			--"double": A double line box.
			--"rounded": Like "single", but with rounded corners ("╭" etc.).
			--"solid": Adds padding by a single whitespace cell.
			--"shadow": A drop shadow effect by blending with the background.
			border = "single",

			-- the title of the window
			title = "",

			--the position of the title
			--can be "left", "center" or "right"
			title_pos = "center",

			-- window title color
			title_color = "#8AAAE5",

			-- window border color
			border_color = "#8AAAE5",
		},
	},
}
