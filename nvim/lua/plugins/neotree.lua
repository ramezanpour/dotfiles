return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("nvim-tree").setup({})
		vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", { desc = "Toggle File Explorer" })
	end,
}
