local M = {}

function M.opts()
    local opts = {
        sections = {
            lualine_c = { "lsp_status", { "navic", }, },
            lualine_x = {
                "filetype",
                { "fileformat", symbols = { unix = "UNIX", dos = "WINDOWS", mac = "MAC", } },
                "encoding"
            },
            lualine_y = {
                "progress", "location"
            },
            lualine_z = {
                { "datetime", style = "default" }
            }
        },
        options = {
            theme = "auto",
            globalstatus = true,
            disabled_filetypes = { statusline = { "dashboard", "alpha", "ministarter", "snacks_dashboard" } },
            extensions = { "fzf", "neo-tree" }
        },
    }
    return opts
end

return M
