local langs = {
    "bash",
    "c",
    "cmake",
    "comment",
    "cpp",
    "cuda",
    "json",
    "lua",
    "markdown",
    "markdown_inline",
    "python",
    "query",
    "nix",
    "rust",
    "toml",
    "vim",
    "vimdoc",
    "yaml",
    "make",
    "llvm",
    "latex",
    "haskell",
    "ocaml",
    "commonlisp",
    "gitcommit",
    "git_config",
    "git_rebase",
    "gitattributes",
    "gitignore",
}

local unique = {}
local visited = {}

for _, lang in ipairs (langs) do
    if not visited[lang] then
        visited[lang] = true
        table.insert (unique, lang)
    end
end

table.sort (unique)

for _, u in ipairs (unique) do
    print ('"' .. u .. '"' .. ",")
end
