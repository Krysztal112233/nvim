local M = {}

function M.config()
    vim.g.rustaceanvim = {
        server = {
            default_settings = {
                ["rust-analyzer"] = {
                    check = false,
                    checkOnSave = false,
                },
            },
        },
    }
end

return M
