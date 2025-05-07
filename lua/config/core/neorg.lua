local M = {}

function M.opts()
    vim.wo.foldlevel = 99
    vim.wo.conceallevel = 2

    return {
        load = {
            ["core.defaults"] = {},
            ["core.concealer"] = {},
            ["core.summary"] = {},
            ["core.dirman"] = {
                config = {
                    workspaces = { notes = "~/notes" },
                    default_workspace = "notes"
                },
            },
        },
    }
end

function M.config()
    require("neorg").setup(M.opts())
end

return M
