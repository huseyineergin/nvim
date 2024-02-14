return {
	"lukas-reineke/indent-blankline.nvim",
	event = { "BufNewFile", "BufReadPre" },
	config = function()
		local ibl = require("ibl")
		ibl.setup({
			scope = {
				enabled = false,
			},
			indent = {
				char = "▏",
			},
		})
	end,
}
