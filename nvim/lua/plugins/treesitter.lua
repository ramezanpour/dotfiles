return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" }, -- lazy-load on file open
	config = function()
		require("nvim-treesitter.configs").setup({
			-- List the languages you want to install
			ensure_installed = { "c", "vimdoc", "python", "javascript", "html", "css" },
			sync_install = false,
			auto_install = true,

			highlight = {
				enable = true,
			},
			indent = {
				enable = true,
			},
			-- Add more modules here if needed
		})
	end,
}
