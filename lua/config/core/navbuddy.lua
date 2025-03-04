local M = {}

function M.opts()
    local actions = require("nvim-navbuddy.actions")
    return {
        window = {
            border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
        },
        icons = require("config.icon").symbol,
        lsp = {
            auto_attach = true,
        },
        mappings = {
            ["<f>"] = actions.fold_create(), -- Create fold of current scope
            ["<F>"] = actions.fold_delete(), -- Delete fold of current scope
        },
    }
end

return M
