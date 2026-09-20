return {
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			signs = {
				add = { text = "▎" },
				change = { text = "▎" },
				delete = { text = "▁" },
				topdelete = { text = "▔" },
				changedelete = { text = "▎" },
				untracked = { text = "▎" },
			},
			signcolumn = true,
			numhl = false,
			word_diff = false,
			diff_opts = {
				internal = true,
				algorithm = "histogram",
				linematch = 60, -- second-stage diff: aligns changed lines within a hunk
				indent_heuristic = true,
			},
			current_line_blame = false, -- toggle with <leader>gB
			current_line_blame_opts = {
				virt_text_pos = "eol",
				delay = 300,
			},
			preview_config = { border = "rounded" },
			on_attach = function(bufnr)
				local gs = require("gitsigns")
				local function map(mode, lhs, rhs, desc)
					vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
				end

				-- Navigation between hunks
				map("n", "]c", function()
					if vim.wo.diff then
						vim.cmd.normal({ "]c", bang = true })
					else
						gs.nav_hunk("next")
					end
				end, "Next git hunk")

				map("n", "[c", function()
					if vim.wo.diff then
						vim.cmd.normal({ "[c", bang = true })
					else
						gs.nav_hunk("prev")
					end
				end, "Previous git hunk")

				-- Actions
				map("n", "<leader>gp", gs.preview_hunk_inline, "Preview hunk (inline)")
				map("n", "<leader>gP", gs.preview_hunk, "Preview hunk (float)")
				-- stage_hunk toggles: run it again on a staged hunk to unstage
				map("n", "<leader>gs", gs.stage_hunk, "Stage/unstage hunk")
				map("v", "<leader>gs", function()
					gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, "Stage/unstage selected lines")
				map("n", "<leader>gR", gs.reset_hunk, "Reset hunk")
				map("v", "<leader>gR", function()
					gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, "Reset selected lines")
				map("n", "<leader>gS", gs.stage_buffer, "Stage buffer")
				map("n", "<leader>gb", gs.blame_line, "Blame line")
				map("n", "<leader>gB", gs.toggle_current_line_blame, "Toggle inline blame")
				map("n", "<leader>gd", gs.diffthis, "Diff against index")
				map("n", "<leader>gD", function()
					gs.diffthis("~")
				end, "Diff against last commit")
				map("n", "<leader>gq", gs.setqflist, "Hunks to quickfix")

				-- Text object: ih = "in hunk"
				map({ "o", "x" }, "ih", gs.select_hunk, "Select hunk")
			end,
		},
	},
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
	{
		"tpope/vim-fugitive",
	},
}
