return {
	{
		"neovim/nvim-lspconfig",
		version = "v2.1.0",
		dependencies = {
			{
				"williamboman/mason.nvim",
				version = "v1.11.0",
			},
			{
				"williamboman/mason-lspconfig.nvim",
				version = "v1.32.0",
			},
			{
				"WhoIsSethDaniel/mason-tool-installer.nvim",
			},
			{
				"j-hui/fidget.nvim",
				version = "v1.6.1",
			},
			{ "folke/neodev.nvim", opts = {} },
		},
		config = function ()
			vim.api.nvim_create_autocmd ("LspAttach", {
				group = vim.api.nvim_create_augroup ("lsp-attach", { clear = true }),
				callback = function (event)
					local client = vim.lsp.get_client_by_id (event.data.client_id)
					if client and client.server_capabilities.documentHighlightProvider then
						vim.api.nvim_create_autocmd ({ "CursorHold", "CursorHoldI" }, {
							buffer = event.buf,
							callback = vim.lsp.buf.document_highlight,
						})

						vim.api.nvim_create_autocmd ({ "CursorMoved", "CursorMovedI" }, {
							buffer = event.buf,
							callback = vim.lsp.buf.clear_references,
						})
					end
				end,
			})
			local capabilities = vim.lsp.protocol.make_client_capabilities ()
			capabilities = vim.tbl_deep_extend ("force", capabilities, require ("cmp_nvim_lsp").default_capabilities ())

			local servers = {
				clangd = {},
				pyright = {},
				rust_analyzer = {
					diagnostics = {
						enable = true,
					},
				},
				bashls = {},
				neocmake = {},
				tinymist = {},
				-- asm_lsp = {},
				-- asmfmt = {},
				-- gopls = {},
				-- glsl_analyzer = {},
				-- perlnavigator = {
				-- 	cmd = { "perlnavigator" },
				-- 	settings = {
				-- 		perlnavigator = {
				-- 			perlPath = "/usr/bin/perl",
				-- 			enableWarnings = true,
				-- 			perltidyProfile = "",
				-- 			perlcriticProfile = "",
				-- 			perlcriticEnabled = true,
				-- 		},
				-- 	},
				-- },
				-- html = {},
				-- hls = {},
				-- ocamllsp = {},
				vimls = {},
				lua_ls = {
					settings = {
						Lua = {
							completion = {
								callSnippet = "Replace",
							},
						},
					},
				},
			}

			require ("mason").setup ()

			local ensure_installed = vim.tbl_keys (servers or {})
			vim.list_extend (ensure_installed, {
				"stylua",
				"black",
				"clang-format",
				"shfmt",
		g	-- "ocamlformat",
			})
			require ("mason-tool-installer").setup ({ ensure_installed = ensure_installed })

			require ("mason-lspconfig").setup ({
				handlers = {
					function (server_name)
						local server = servers[server_name] or {}
						server.capabilities = vim.tbl_deep_extend ("force", {}, capabilities, server.capabilities or {})
						require ("lspconfig")[server_name].setup (server)
					end,
				},
			})

			-- https://mason-registry.dev/registry/list?search=

			-- local lspconfig = require("lspconfig")

			-- lspconfig.ocamllsp.setup({})
			-- https://github.com/ocaml/ocaml-lsp

			-- lspconfig.perlnavigator.setup({
			-- 	cmd = { "perlnavigator" },
			-- 	settings = {
			-- 		perlnavigator = {
			-- 			perlPath = "perl",
			-- 			enableWarnings = true,
			-- 			perltidyProfile = "",
			-- 			perlcriticProfile = "",
			-- 			perlcriticEnabled = true,
			-- 		},
			-- 	},
			-- })
			-- https://github.com/bscan/PerlNavigator

			-- lspconfig.opencl_ls.setup({})
			-- https://github.com/Galarius/opencl-language-server

			-- lspconfig.hls.setup({})
			-- https://haskell-language-server.readthedocs.io/en/latest/installation.html

			-- lspconfig.glsl_analyzer.setup({
			-- 	filetypes = {
			-- 		"glsl",
			-- 		"vert",
			-- 		"vs",
			-- 		"fs",
			-- 	},
			-- })
			-- https://github.com/nolanderc/glsl_analyzer

			-- lspconfig.vimls.setup({})
			-- https://github.com/iamcco/vim-language-server

			-- lspconfig.bashls.setup({})
			-- https://github.com/bash-lsp/bash-language-server

			-- lspconfig.rust_analyzer.setup({})
			-- https://rust-analyzer.github.io/manual.html

			-- lspconfig.pyright.setup({})

			-- lspconfig.clangd.setup({})
			-- https://clangd.llvm.org/installation.html

			-- lspconfig.lua_ls.setup({})
			-- https://luals.github.io/#install

			-- if not require("lspconfig.configs").neocmake then
			-- 	require("lspconfig.configs").neocmake = {
			-- 		default_config = {
			-- 			cmd = { "neocmakelsp", "--stdio" },
			-- 			filetypes = { "cmake" },
			-- 			root_dir = function(fname)
			-- 				return lspconfig.util.find_git_ancestor(fname)
			-- 			end,
			-- 			single_file_support = true, -- suggested
			-- 			on_attach = on_attach, -- on_attach is the on_attach function you defined
			-- 			init_options = {
			-- 				format = {
			-- 					enable = true,
			-- 				},
			-- 				lint = {
			-- 					enable = true,
			-- 				},
			-- 				scan_cmake_in_package = true, -- default is true
			-- 			},
			-- 		},
			-- 	}
			-- 	lspconfig.neocmake.setup({})
			-- end
			-- https://github.com/neocmakelsp/neocmakelsp?tab=readme-ov-file#installation
		end,
	},
}
