return {
    {
        "hrsh7th/nvim-cmp",
        -- version = "v0.0.2",
        commit = "059e89495b3ec09395262f16b1ad441a38081d04",
        event = "InsertEnter",
        dependencies = {
            {
                "L3MON4D3/LuaSnip",
                commit = "faf3c94a44508cec1b961406d36cc65113ff3b98",
                build = (function ()
                    if vim.fn.has ("win32") == 1 or vim.fn.executable ("make") == 0 then return end
                    return "make install_jsregexp"
                end) (),
                dependencies = {},
            },
            { "saadparwaiz1/cmp_luasnip" },
            { "hrsh7th/cmp-nvim-lsp", commit = "a8912b88ce488f411177fc8aed358b04dc246d7b" },
            { "hrsh7th/cmp-path" },
        },
        config = function ()
            local cmp = require ("cmp")
            local luasnip = require ("luasnip")
            luasnip.config.setup ({})

            cmp.setup ({
                snippet = {
                    expand = function (args) luasnip.lsp_expand (args.body) end,
                },
                sorting = {
                    comparators = {
                        ---@diagnostic disable-next-line: missing-fields
                        cmp.config.compare.offset,
                        cmp.config.compare.offset,
                        cmp.config.compare.exact,
                        cmp.config.compare.recently_used,
                        require ("clangd_extensions.cmp_scores"),
                        cmp.config.compare.kind,
                        cmp.config.compare.sort_text,
                        cmp.config.compare.length,
                        cmp.config.compare.order,
                    },
                    priority_weight = 0,
                },
                completion = { completeopt = "menu,menuone,noinsert" },
                mapping = cmp.mapping.preset.insert ({
                    ["<C-n>"] = cmp.mapping.select_next_item (),
                    ["<C-p>"] = cmp.mapping.select_prev_item (),

                    ["<C-j>"] = cmp.mapping.scroll_docs (-1),
                    ["<C-k>"] = cmp.mapping.scroll_docs (1),

                    ["<CR>"] = cmp.mapping.confirm ({ select = true }),

                    -- ["<C-Space>"] = cmp.mapping.complete({}),

                    ["<C-l>"] = cmp.mapping (function ()
                        if luasnip.expand_or_locally_jumpable () then luasnip.expand_or_jump () end
                    end, { "i", "s" }),
                    ["<C-h>"] = cmp.mapping (function ()
                        if luasnip.locally_jumpable (-1) then luasnip.jump (-1) end
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
}
