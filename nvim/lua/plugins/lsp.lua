return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"mason-org/mason.nvim",
			"mason-org/mason-lspconfig.nvim",
		},
		config = function()
			local packages = {
				"prettier",
				"pyrefly",
				"ruff",
				"eslint_d",
				"stylua",
				"markdownlint",
				"lua_ls",
				"gopls",
				"goimports",
				"gofumpt",
				"eslint-lsp",
			}
			require("mason").setup({
				ensure_installed = packages,
			})
			require("mason-lspconfig").setup({})
			vim.api.nvim_create_autocmd("CursorHold", {
				callback = function()
					vim.diagnostic.open_float(nil, { focusable = false })
				end,
			})
		end,
	},
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		config = function()
			require("conform").setup({
				format_on_save = {
					lsp_fallback = true,
					timeout_ms = 1000,
				},
				formatters_by_ft = {
					lua = { "stylua" },
					python = { "ruff_format", "isort" },
					javascript = { "prettier" },
					typescript = { "prettier" },
					json = { "prettier" },
					markdown = { "prettier" },
					html = { "prettier" },
					css = { "prettier" },
					go = { "gofumpt" },
				},
			})
		end,
	},
	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local lint = require("lint")

			lint.linters_by_ft = {
				python = { "ruff" },
				javascript = { "eslint_d" },
				typescript = { "eslint_d" },
				markdown = { "markdownlint" },
			}

			-- Automatically lint on save
			vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "InsertLeave" }, {
				callback = function()
					lint.try_lint()
				end,
			})
		end,
	},
}
