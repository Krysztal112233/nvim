local M = {}

function M.config()
    require('scrollview').setup({
        excluded_filetypes = { 'neo-tree' },
        current_only = true,
        base = 'right',
        signs_on_startup = { 'all' },
        diagnostics_severities = { vim.diagnostic.severity.ERROR }
    })
end

return M
