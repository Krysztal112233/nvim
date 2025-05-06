local M = {}

M.opts = {
    auto_install = true,
    highlight = { enable = true },
    ensure_installed = { "all" },
    ignore_install = { "org" }
}

function M.config(opts)
    require("nvim-treesitter.configs").setup(opts)
end

return M
