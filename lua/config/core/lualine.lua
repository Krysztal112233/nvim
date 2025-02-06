local M = {}

function M.opts()
    local opts = {
        options = {
            theme = "auto",
            globalstatus = true,
            disabled_filetypes = { statusline = { "dashboard", "alpha", "ministarter", "snacks_dashboard" } },
            extensions = { "quickfix" }
        },
    }
    return opts
end

return M
