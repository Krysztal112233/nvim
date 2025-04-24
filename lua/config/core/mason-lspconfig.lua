local M = {}

function M.config()
    local lsp_config = require("config.lsp")

    require("mason-lspconfig").setup({
        ensure_installed = lsp_config.ensure_installed,
        automatic_installation = false,
    })

    local tbl = vim.tbl_extend("force",
        {
            function(server_name)
                vim.lsp.enable(server_name)
                vim.lsp.config(server_name, {})
            end
        },
        lsp_config.override_handles
    )

    require("mason-lspconfig").setup_handlers(tbl)
end

return M
