return {
	{
		"echasnovski/mini.misc",
		version = "v0.16.0",
		config = function ()
			require ("mini.misc").setup ()
			MiniMisc.setup_termbg_sync ()
		end,
	},
}
