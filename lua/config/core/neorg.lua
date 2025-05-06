local M = {}

function M.opts()
    return {
        load = {
            ["core.defaults"] = {},
            ["core.completion"] = {
                config = { engine = { module_name = "external.lsp-completion" } },
            },
            ["core.integrations.treesitter"] = {},
            ["core.concealer"] = require("config.core.neorg.concealer"),
            ["core.dirman"] = require("config.core.neorg.dirman"),
            ["external.interim-ls"] = require("config.core.neorg.interim-ls"),
        }
    }
end

function M.config()
    require("neorg").setup(M.opts())
end

return M
