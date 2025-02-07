local M = {}

function M.opts()
    return {
        window = {
            position = {
                row = "100%",
                col = "100%",
            },
            border = "rounded",
        },
        lsp = {
            auto_attach = true,
        },
    }
end

return M
