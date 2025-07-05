return {
	{
		"rhysd/git-messenger.vim",
		keys = {
			{ "<leader>gm", "<Plug>(git-messenger)", desc = "Git Messenger (blame popup)" },
		},
		init = function()
			vim.g.git_messenger_no_default_mappings = true
		end,
	},
	{
		"ruifm/gitlinker.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("gitlinker").setup({
				mappings = nil, -- disable default mappings
			})

			-- Optional: add a custom mapping
			vim.keymap.set("n", "<leader>gy", function()
				require("gitlinker").get_buf_range_url(
					"n",
					{ action_callback = require("gitlinker.actions").copy_to_clipboard }
				)
			end, { desc = "Copy Git URL to clipboard (current line)" })

			vim.keymap.set("v", "<leader>gy", function()
				require("gitlinker").get_buf_range_url(
					"v",
					{ action_callback = require("gitlinker.actions").copy_to_clipboard }
				)
			end, { desc = "Copy Git URL to clipboard (selection)" })
		end,
	},
}
