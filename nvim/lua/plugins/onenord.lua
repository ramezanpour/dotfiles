return {
	"rmehri01/onenord.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("onenord").setup({
			-- Your configuration here
			-- e.g. theme = "dark", borders = true, etc.
		})
		vim.cmd.colorscheme("onenord") -- set the colorscheme
	end
}
