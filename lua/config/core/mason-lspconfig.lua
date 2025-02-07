local M = {}

function M.config()
    local lsp_config = require("config.lsp").mason_lspconfig

    require("mason-lspconfig").setup {
        ensure_installed = lsp_config.ensure_installed,
        automatic_installation = lsp_config.ensure_installed,
    }
end

return M
