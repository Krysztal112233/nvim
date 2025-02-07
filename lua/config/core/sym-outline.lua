local M = {}

function M.opts()
    local opts = {
        preview_window = {
            winhl = "NormalFloat:",
        },
    }
    return opts
end

function M.config()
    require("outline").setup({})
end

return M
