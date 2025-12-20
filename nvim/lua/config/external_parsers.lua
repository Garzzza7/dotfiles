---@diagnostic disable: inject-field
-- TYPST GRAMMAR
require ("nvim-treesitter.parsers").get_parser_configs ().typst = {
    install_info = {
        url = "https://github.com/uben0/tree-sitter-typst",
        files = { "src/parser.c", "src/scanner.c" },
        branch = "master",
        generate_requires_npm = false,
        requires_generate_from_grammar = true,
    },
    filetype = "typ",
}

-- ASM GRAMMAR
require ("nvim-treesitter.parsers").get_parser_configs ().asm = {
    install_info = {
        url = "https://github.com/RubixDev/tree-sitter-asm",
        files = { "src/parser.c" },
        branch = "main",
        generate_requires_npm = false,
        requires_generate_from_grammar = true,
    },
    filetype = "asm",
}

-- DISASSEMBLY GRAMMAR
require ("nvim-treesitter.parsers").get_parser_configs ().disassembly = {
    install_info = {
        url = "https://github.com/ColinKennedy/tree-sitter-disassembly",
        files = { "src/parser.c", "src/scanner.c" },
        branch = "master",
        generate_requires_npm = false,
        requires_generate_from_grammar = true,
    },
    filetype = "S",
}

-- NIM GRAMMAR
require ("nvim-treesitter.parsers").get_parser_configs ().nim = {
    install_info = {
        url = "https://github.com/alaviss/tree-sitter-nim",
        files = { "src/parser.c", "src/scanner.c" },
        branch = "main",
        generate_requires_npm = false,
        requires_generate_from_grammar = true,
    },
    filetype = "nim",
}

-- LINKERSCRIPT GRAMMAR
require ("nvim-treesitter.parsers").get_parser_configs ().linkerscript = {
    install_info = {
        url = "https://github.com/tree-sitter-grammars/tree-sitter-linkerscript",
        files = { "src/parser.c" },
        branch = "master",
        generate_requires_npm = false,
        requires_generate_from_grammar = true,
    },
    filetype = "ls",
}
