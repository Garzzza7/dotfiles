return {
	{
		"p00f/clangd_extensions.nvim",
		commit = "db28f29be928d18cbfb86fbfb9f83f584f658feb",
		config = function ()
			require ("clangd_extensions").setup ({
				ast = {
					-- These are unicode, should be available in any font
					role_icons = {
						type = "🄣",
						declaration = "🄓",
						expression = "🄔",
						statement = ";",
						specifier = "🄢",
						["template argument"] = "🆃",
					},
					kind_icons = {
						Compound = "🄲",
						Recovery = "🅁",
						TranslationUnit = "🅄",
						PackExpansion = "🄿",
						TemplateTypeParm = "🅃",
						TemplateTemplateParm = "🅃",
						TemplateParamObject = "🅃",
					},
					-- These require codicons (https://github.com/microsoft/vscode-codicons)
					-- role_icons = {
					-- 	type = "",
					-- 	declaration = "",
					-- 	expression = "",
					-- 	specifier = "",
					-- 	statement = "",
					-- 	["template argument"] = "",
					-- },
					--
					-- kind_icons = {
					-- 	Compound = "",
					-- 	Recovery = "",
					-- 	TranslationUnit = "",
					-- 	PackExpansion = "",
					-- 	TemplateTypeParm = "",
					-- 	TemplateTemplateParm = "",
					-- 	TemplateParamObject = "",
					-- },

					highlights = {
						detail = "Comment",
					},
				},
				memory_usage = {
					border = "none",
				},
				symbol_info = {
					border = "none",
				},
			})
		end,
	},
}
