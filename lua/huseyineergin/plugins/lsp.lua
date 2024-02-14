return {
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		config = function()
			local lsp_zero = require("lsp-zero")
			lsp_zero.set_sign_icons({
				error = "",
				warn = "",
				hint = "󰠠",
				info = "",
			})
		end,
		lazy = true,
		init = function()
			-- Disable automatic setup, we are doing it manually
			vim.g.lsp_zero_extend_cmp = 0
			vim.g.lsp_zero_extend_lspconfig = 0
		end,
	},
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_pending = "➜",
						package_installed = "✓",
						package_uninstalled = "✗",
					},
				},
			})
		end,
		lazy = false,
	},
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"L3MON4D3/LuaSnip",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-buffer",
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
		config = function()
			local cmp = require("cmp")
			local lsp_zero = require("lsp-zero")

			lsp_zero.extend_cmp()

			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				sources = {
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "path" },
				},
				formatting = require("lsp-zero").cmp_format(),
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-e>"] = cmp.mapping.abort(),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-p>"] = cmp.mapping.select_prev_item(),
					["<C-n>"] = cmp.mapping.select_next_item(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				}),
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		cmd = {
			"LspInfo",
			"LspStart",
			"LspInstall",
		},
		event = {
			"BufReadPre",
			"BufNewFile",
		},
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			local lsp_zero = require("lsp-zero")
			lsp_zero.extend_lspconfig()

			lsp_zero.on_attach(function(_, bufnr)
				-- lsp_zero.buffer_autoformat()
				local opts = { buffer = bufnr, remap = false }
				vim.keymap.set("n", "K", function()
					vim.lsp.buf.hover()
				end, opts)

				vim.keymap.set("n", "gd", function()
					vim.lsp.buf.definition()
				end, opts)
				vim.keymap.set("n", "]d", function()
					vim.diagnostic.goto_prev()
				end, opts)
				vim.keymap.set("n", "[d", function()
					vim.diagnostic.goto_next()
				end, opts)
				vim.keymap.set("n", "<leader>vrn", function()
					vim.lsp.buf.rename()
				end, opts)
				vim.keymap.set("n", "<leader>vrr", function()
					vim.lsp.buf.references()
				end, opts)
				vim.keymap.set("n", "<leader>vca", function()
					vim.lsp.buf.code_action()
				end, opts)
				vim.keymap.set("n", "<leader>vd", function()
					vim.diagnostic.open_float()
				end, opts)
				vim.keymap.set("n", "<leader>vws", function()
					vim.lsp.buf.workspace_symbol()
				end, opts)
			end)

			require("mason-lspconfig").setup({
				ensure_installed = {
					"gopls",
					"lua_ls",
				},
				handlers = {
					lsp_zero.default_setup,
					lua_ls = function()
						local lua_opts = lsp_zero.nvim_lua_ls()
						require("lspconfig").lua_ls.setup(lua_opts)
					end,
				},
			})
		end,
	},
}
