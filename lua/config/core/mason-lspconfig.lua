local M = {}

function M.config()
    local lsp_config = require("config.lsp")

    require("mason-lspconfig").setup({
        ensure_installed = lsp_config.ensure_installed,
        automatic_installation = true,
    })
end

return M
