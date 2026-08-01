return {
	"junegunn/goyo.vim",
	cmd = { "Goyo" },
	keys = {
		{ "<leader>z", "<cmd>Goyo<cr>", desc = "Toggle Goyo (distraction-free writing)" },
	},
	init = function()
		vim.g.goyo_width = 100
	end,
}
