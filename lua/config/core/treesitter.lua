local M = {}

function M.opts()
    return {
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
        ensure_installed = {
            "c",
            "go",
            "gomod",
            "gosum",
            "lua",
            "markdown",
            "markdown_inline",
            "rust",
            "sql",
            "vim",
            "vimdoc",
        },
    }
end

function M.config()
    require("nvim-treesitter.configs").setup(M.opts())
end

return M
