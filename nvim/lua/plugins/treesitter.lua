return {
    {
        "nvim-treesitter/nvim-treesitter",
        -- version = "*",
        version = "v0.9.1",
        -- version = "v0.9.3",
        config = function ()
            require ("nvim-treesitter.configs").setup ({
                ensure_installed = {
                    "bash",
                    "c",
                    "cmake",
                    "comment",
                    "commonlisp",
                    "cpp",
                    "cuda",
                    "git_config",
                    "git_rebase",
                    "gitattributes",
                    "gitcommit",
                    "gitignore",
                    "haskell",
                    "json",
                    "latex",
                    "llvm",
                    "lua",
                    "markdown",
                    "markdown_inline",
                    "nix",
                    "ocaml",
                    "python",
                    "query",
                    "rust",
                    "toml",
                    "vim",
                    "vimdoc",
                    "yaml",
                },
                modules = {},
                ignore_install = { "matlab", "make" },

                auto_install = false,
                sync_install = false,
                ignore_missing = true,

                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                    custom_captures = {},
                    loaded = false,
                },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "gnn",
                        node_decremental = "grm",
                        node_incremental = "grn",
                        scope_incremental = "grc",
                    },
                },
                indent = {
                    enable = false,
                },
            })
        end,
    },
}
