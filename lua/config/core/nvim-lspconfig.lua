local M = {}

function M.config()
    -- Enable inlayhints
    vim.lsp.inlay_hint.enable(true)

    local servers = require("config.lsp").lspconfig
    for server, config in pairs(servers) do
        if vim.tbl_contains(require("config.lsp").servers_skip_config, server) == true then
            goto continue
        end

        vim.lsp.enable(server)
        vim.lsp.config(server, config)

        ::continue::
    end

    vim.lsp.enable("lua_ls")
    vim.lsp.config("lua_ls", {
        settings = {
            Lua = {
                diagnostics = { globals = { "vim" } },
                workspace = {
                    library = vim.api.nvim_get_runtime_file("", true),
                },
                telemetry = { enable = false },
            },
        },
    })

    require("lspconfig").gleam.setup({})
end

return M
