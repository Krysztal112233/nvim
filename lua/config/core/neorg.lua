local M = {}

function M.opts()
    vim.wo.foldlevel = 99
    vim.wo.conceallevel = 2

    return {
        load = {
            ["core.completion"] = { config = { engine = { module_name = "external.lsp-completion" } } },
            ["core.concealer"] = {},
            ["core.defaults"] = {},
            ["core.export.markdown"] = {},
            ["core.export"] = {},
            ["core.journal"] = { config = { strategy = "flat" } },
            ["core.summary"] = {},
            ["core.dirman"] = {
                config = {
                    workspaces = { notes = "~/notes" },
                    default_workspace = "notes"
                },
            },
            ["external.interim-ls"] = {
                config = {
                    completion_provider = {
                        enable = true,
                        documentation = true,
                        categories = false,
                    }
                }
            },
        },
    }
end

function M.config()
    require("neorg").setup(M.opts())
end

return M
