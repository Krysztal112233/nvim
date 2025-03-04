local M = {}

function M.opts()
    return {
        indent = { enabled = true },
        scope = { enabled = true },
        input = { enabled = true },
        lazygit = {},
    }
end

function M.config() end

return M
