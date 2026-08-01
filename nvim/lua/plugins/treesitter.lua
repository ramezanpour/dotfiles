return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    lazy = false,
    config = function()
        local ts = require("nvim-treesitter")

        -- Parsers to install up front. Everything else is installed on demand
        -- by the FileType autocmd below.
        local ensure_installed = {
            "c",
            "vimdoc",
            "python",
            "javascript",
            "typescript",
            "tsx",
            "html",
            "css",
            "go",
            "lua",
            "markdown",
            "markdown_inline",
            "json",
            "yaml",
            "gitcommit",
            "bash",
        }

        ts.install(ensure_installed)

        -- parser name -> filetype, where they differ
        vim.treesitter.language.register("vimdoc", "help")
        vim.treesitter.language.register("tsx", "typescriptreact")

        -- Cache the set of parsers nvim-treesitter can provide. get_available()
        -- fires a User autocmd on every call, so compute it lazily and once.
        local available
        local function is_available(lang)
            if not available then
                available = {}
                for _, l in ipairs(ts.get_available()) do
                    available[l] = true
                end
            end
            return available[lang] == true
        end

        local function is_installed(lang)
            return vim.tbl_contains(ts.get_installed(), lang)
        end

        -- Start treesitter for any filetype that has a parser, installing it on
        -- demand the first time such a file is opened.
        vim.api.nvim_create_autocmd("FileType", {
            callback = function(args)
                local lang = vim.treesitter.language.get_lang(args.match)
                if not lang or not is_available(lang) then
                    return
                end

                local function start(buf)
                    if not vim.api.nvim_buf_is_valid(buf) then
                        return
                    end
                    vim.treesitter.start(buf)
                    vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end

                if is_installed(lang) then
                    start(args.buf)
                else
                    ts.install({ lang }):await(function(err)
                        if err then
                            return
                        end
                        vim.schedule(function()
                            start(args.buf)
                        end)
                    end)
                end
            end,
        })
    end,
}
