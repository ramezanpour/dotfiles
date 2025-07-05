-- Set leader key
vim.g.mapleader = ","

-- Editor settings
vim.opt.wrap = true
vim.opt.mouse = "a"
vim.opt.colorcolumn = "120"
vim.opt.clipboard:append("unnamedplus")
vim.opt.swapfile = false
vim.opt.autoread = true
vim.opt.backup = false
vim.opt.smartcase = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.backspace = { "indent", "eol", "start" }
vim.opt.number = true
vim.opt.errorbells = false
vim.opt.visualbell = false
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.o.splitright = true
vim.cmd("filetype plugin indent on")

require("paq")({
	"savq/paq-nvim",
	"ryanoasis/vim-devicons",
	{ "nvim-treesitter/nvim-treesitter", branch = "master" },
	"rhysd/git-messenger.vim",
	"preservim/nerdcommenter",
	"preservim/nerdtree",
	{
		"junegunn/fzf",
		run = function()
			vim.fn["fzf#install"]()
		end,
	},
	"junegunn/fzf.vim",
	{ "iamcco/markdown-preview.nvim", run = "cd app && yarn install" },
	"jiangmiao/auto-pairs",
	"vim-airline/vim-airline",
	"vim-airline/vim-airline-themes",
	"romainl/vim-cool",
	"ap/vim-css-color",
	"arcticicestudio/nord-vim",
	"neovim/nvim-lspconfig",
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"onsails/lspkind-nvim",
	"nvim-lua/plenary.nvim",
	"stevearc/conform.nvim",
	"mfussenegger/nvim-lint",
	{ "rmehri01/onenord.nvim", branch = "main" },
})

local lspconfig = require("lspconfig")
vim.lsp.enable("pyright")
vim.lsp.enable("ts_ls")
vim.lsp.enable("html")

lspconfig.lua_ls.setup({
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

local cmp = require("cmp")

cmp.setup({
	snippet = {
		expand = function(args)
			-- For `luasnip` users, otherwise leave empty
			-- require('luasnip').lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "buffer" },
		{ name = "path" },
	}),
	formatting = {
		format = require("lspkind").cmp_format({ with_text = true, maxwidth = 50 }),
	},
})

-- Code formatting
require("conform").setup({
	format_on_save = {
		lsp_fallback = true,
		timeout_ms = 1000,
	},
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "black" },
		javascript = { "prettier" },
		typescript = { "prettier" },
		json = { "prettier" },
		markdown = { "prettier" },
	},
})

-- treesitter
require("nvim-treesitter.configs").setup({
	ensure_installed = { "javascript", "typescript", "lua", "vim", "json", "html", "go", "tsx", "python", "vimdoc" },
	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true,
	},
})

-- lint
require("lint").linters_by_ft = {
	python = { "ruff" },
	javascript = { "eslint" },
}

vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "InsertLeave" }, {
	callback = function()
		require("lint").try_lint()
	end,
})

-- Enable syntax highlighting
vim.cmd("syntax on")

-- Nord theme settings
vim.g.nord_cursor_line_number_background = 1
vim.g.nord_bold_vertical_split_line = 1
vim.g.nord_italic_comments = 1
vim.opt.background = "dark"
vim.cmd("colorscheme onenord")
vim.cmd([[let g:airline_theme = 'deus']])

-- Window navigation mappings
vim.keymap.set("", "<C-j>", "<C-w>j")
vim.keymap.set("", "<C-k>", "<C-w>k")
vim.keymap.set("", "<C-h>", "<C-w>h")
vim.keymap.set("", "<C-l>", "<C-w>l")

-- NERDTree Toggle
vim.keymap.set("n", "<C-n>", ":NERDTreeToggle<CR>")

-- Show hidden files in NERDTree
vim.g.NERDTreeShowHidden = 1

-- NERDCommenter config
vim.g.NERDCompactSexyComs = 1

-- FZF Mappings
vim.keymap.set("n", "<Leader>f", ":Ag<CR>", { silent = true })
vim.keymap.set("n", "<C-p>", ":Files<CR>", { silent = true })
vim.keymap.set("n", "<Leader><Space>", ":BLines<CR>", { silent = true })

vim.keymap.set("n", "gv", function()
	vim.cmd("vsplit")
	vim.lsp.buf.definition()
end)
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "K", vim.lsp.buf.hover)
