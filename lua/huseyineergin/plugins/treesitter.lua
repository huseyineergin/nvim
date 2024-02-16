return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufRead", "BufNewFile" },
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			auto_install = true,
			sync_install = false,
			indent = { enable = true },
			highlight = { enable = true },
		})
	end,
}
