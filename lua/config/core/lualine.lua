local M = {}

function M.opts()
    local opts = {
        sections = {
            lualine_c = {
                {
                    "navic",
                    color_correction = nil,
                    navic_opts = nil
                }
            }
        },
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
