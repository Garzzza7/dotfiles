---@diagnostic disable: inject-field
-- TYPYST GRAMMAR
require("nvim-treesitter.parsers").get_parser_configs().typst = {
	install_info = {
		url = "https://github.com/uben0/tree-sitter-typst", -- local path or git repo
		files = { "src/parser.c", "src/scanner.c" }, -- note that some parsers also require src/scanner.c or src/scanner.cc
		-- optional entries:
		branch = "master", -- default branch in case of git repo if different from master
		generate_requires_npm = false, -- if stand-alone parser without npm dependencies
		requires_generate_from_grammar = true, -- if folder contains pre-generated src/parser.c
	},
	filetype = "typ", -- if filetype does not match the parser name
}
