local M = {}

M.opts = {
    auto_install = true,
    highlight = {
        enable = true,
    },
    ensure_installed = {
        "bash",
        "c",
        "cpp",
        "diff",
        "gleam",
        "gomod",
        "gosum",
        "gowork",
        "javascript",
        "jsdoc",
        "json",
        "jsonc",
        "lua",
        "luadoc",
        "luap",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "toml",
        "typescript",
        "vim",
        "vimdoc",
        "yaml",
    },
}

function M.config(opts)
    require("nvim-treesitter.configs").setup(opts)
end

return M
