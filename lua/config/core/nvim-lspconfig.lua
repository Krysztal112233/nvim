local M = {}

function M.config()
    -- Enable inlayhints
    vim.lsp.inlay_hint.enable(true)

    local servers = require("config.lsp").servers
    for server, config in pairs(servers) do
        if require("utils").contains(require("config.lsp").servers_skip_config, server) == true then
            goto continue
        end

        require("lspconfig")[server].setup({
            settings = config,
        })
        ::continue::
    end

    require("lspconfig").gleam.setup({})
end

return M
