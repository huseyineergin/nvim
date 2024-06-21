return {
	"stevearc/conform.nvim",
	event = { "BufNewFile", "BufReadPre" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "black" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				javascript = { "prettier" },
				go = { "goimports", "gofmt" },
			},
			format_on_save = {
				lsp_fallback = true,
				timeout_ms = 500,
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>rf", function()
			conform.format({
				lsp_fallback = true,
				timeout_ms = 500,
			})
		end)
	end,
}
