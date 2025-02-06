local M = {}

function M.cond()
    return vim.fn.isdirectory('.git') == 1
end

function M.config()
    require('gitsigns').setup {
        signs = {
            add          = { text = '+' },
            change       = { text = '~' },
            delete       = { text = '_' },
            topdelete    = { text = '‾' },
            changedelete = { text = '~' },
        },
        current_line_blame = true, -- Show current line's Git blame
    }
end

return M
