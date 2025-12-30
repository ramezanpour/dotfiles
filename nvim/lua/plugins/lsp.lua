return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"mason-org/mason.nvim",
			"mason-org/mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			local ts_server = vim.lsp.config and "ts_ls" or "tsserver"
			local packages = {
				"prettier",
				"pyright",
				"ruff",
				"isort",
				"eslint_d",
				"stylua",
				"markdownlint",
				"goimports",
				"gofumpt",
				"typescript-language-server",
			}
			local lsp_servers = {
				"pyright",
				"lua_ls",
				"gopls",
				"eslint",
				ts_server,
			}
			require("mason").setup({
				ensure_installed = packages,
			})
			require("mason-lspconfig").setup({
				ensure_installed = lsp_servers,
			})
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			if vim.lsp.config then
				for _, server in ipairs(lsp_servers) do
					local opts = {
						capabilities = capabilities,
					}
					if server == "pyright" then
						opts.settings = {
							python = {
								analysis = {
									autoSearchPaths = true,
									useLibraryCodeForTypes = true,
								},
							},
						}
					end
					vim.lsp.config(server, opts)
					vim.lsp.enable(server)
				end
			else
				local lspconfig = require("lspconfig")
				local mason_lspconfig = require("mason-lspconfig")
				if mason_lspconfig.setup_handlers then
					mason_lspconfig.setup_handlers({
						function(server_name)
							lspconfig[server_name].setup({
								capabilities = capabilities,
							})
						end,
						["pyright"] = function()
							lspconfig.pyright.setup({
								capabilities = capabilities,
								settings = {
									python = {
										analysis = {
											autoSearchPaths = true,
											useLibraryCodeForTypes = true,
										},
									},
								},
							})
						end,
					})
				else
					for _, server in ipairs(lsp_servers) do
						if server == "pyright" then
							lspconfig.pyright.setup({
								capabilities = capabilities,
								settings = {
									python = {
										analysis = {
											autoSearchPaths = true,
											useLibraryCodeForTypes = true,
										},
									},
								},
							})
						else
							lspconfig[server].setup({
								capabilities = capabilities,
							})
						end
					end
				end
			end
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
					go = { "gofumpt", "goimports" },
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
