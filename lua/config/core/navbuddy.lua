local M = {}

function M.opts()
    local actions = require("nvim-navbuddy.actions")
    return {
        icons = require("config.icon").symbol,
        window = {
            position = {
                row = "100%",
                col = "100%",
            },
            border = "rounded",
            size = "40%",
            sections = {
                left = { size = "20%", },
                mid = { size = "30%", },
            },
        },
        lsp = {
            auto_attach = true,
        },
        mappings = {
            ["<A-f>"] = actions.fold_create(), -- Create fold of current scope
            ["<A-F>"] = actions.fold_delete(), -- Delete fold of current scope
        }
    }
end

return M
