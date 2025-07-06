return {
	"numToStr/Comment.nvim",
	config = function()
		require("Comment").setup({
			-- Disable default keymaps so you can define your own
			mappings = {
				basic = false,
				extra = false,
			},
		})

		local map = vim.keymap.set
		local api = require("Comment.api")

		-- Normal mode: Toggle line comment
		map("n", "<leader>cc", api.toggle.linewise.current, { desc = "Toggle comment line" })

		-- Visual mode: Toggle selected lines
		map("v", "<leader>cc", function()
			-- Ensure visual selection is preserved
			vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "nx", false)
			api.toggle.linewise(vim.fn.visualmode())
		end, { desc = "Toggle comment selection" })
	end,
}
