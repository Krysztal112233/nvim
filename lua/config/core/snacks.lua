local M = {}

function M.opts()
    return {
        indent = { enabled = true },
        scope = { enabled = true },
        input = { enabled = true },
        scroll = { enabled = true },
        lazygit = {},
    }
end

function M.config() end

return M
