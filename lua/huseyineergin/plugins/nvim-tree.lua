return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		require("nvim-tree").setup({
			view = {
				relativenumber = true,
				signcolumn = "no",
			},
		})

		vim.keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>")
		vim.keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>")
		vim.keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>")
	end,
}
