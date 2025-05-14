local M = {}

function M.config()
    local lsp_config = require("config.lsp")

    require("mason-lspconfig").setup({
        ensure_installed = lsp_config.ensure_installed,
        automatic_installation = true,
        automatic_enable = { exclude = { "rust_analyzer", "ts_ls" } }
    })
end

return M
