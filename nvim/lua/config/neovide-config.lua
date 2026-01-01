if vim.g.neovide == true then
    vim.keymap.set ({ "n", "x" }, "<C-S-C>", '"+y', { desc = "Copy system clipboard" })
    vim.keymap.set ({ "n", "x" }, "<C-S-V>", '"+p', { desc = "Paste system clipboard" })

    vim.keymap.set ("n", "gd", function ()
        local cword = vim.fn.expand ("<cword>")
        if cword == "" then return end
        local clients = vim.lsp.get_clients ()
        if next (clients) == nil then
            local response = vim.cmd ("normal! gd")
        else
            -- pcall (vim.lsp.buf.definition)
            require ("telescope.builtin").lsp_definitions ({ reuse_win = true })
        end
    end, { noremap = true, silent = true, desc = "[G]oto [D]efinition" })

    vim.api.nvim_set_keymap ("n", "<C-=>", ":lua vim.g.neovide_scale_factor = math.min(vim.g.neovide_scale_factor + 0.1,  1.0)<CR>", { silent = true })
    vim.api.nvim_set_keymap ("n", "<C-->", ":lua vim.g.neovide_scale_factor = math.max(vim.g.neovide_scale_factor - 0.1,  0.1)<CR>", { silent = true })
    vim.api.nvim_set_keymap ("n", "<C-+>", ":lua vim.g.neovide_transparency = math.min(vim.g.neovide_transparency + 0.03, 1.0)<CR>", { silent = true })
    vim.api.nvim_set_keymap ("n", "<C-_>", ":lua vim.g.neovide_transparency = math.max(vim.g.neovide_transparency - 0.03, 0.0)<CR>", { silent = true })
    vim.api.nvim_set_keymap ("n", "<C-0>", ":lua vim.g.neovide_scale_factor = 0.5<CR>", { silent = true })
    vim.api.nvim_set_keymap ("n", "<C-)>", ":lua vim.g.neovide_transparency = 0.9<CR>", { silent = true })
end
