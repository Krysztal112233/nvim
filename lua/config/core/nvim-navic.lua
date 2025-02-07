local M = {}

function M.opts()
    return {
        lsp = {
            auto_attach = true,
        },
        icons = require("config.icon").symbol,
    }
end

return M
