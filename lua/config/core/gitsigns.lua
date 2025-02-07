local M = {}

function M.cond()
    return vim.fn.isdirectory('.git') == 1
end

function M.config()
    local icon = require("config.icon").git
    require('gitsigns').setup {
        signs = {
            add          = { text = icon.add },
            change       = { text = icon.change },
            delete       = { text = icon.delete },
            topdelete    = { text = icon.topdelete },
            changedelete = { text = icon.changedelete },
        },
        current_line_blame = true, -- Show current line's Git blame
    }
end

return M
