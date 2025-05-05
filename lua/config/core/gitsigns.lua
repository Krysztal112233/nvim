local M = {}

function M.cond()
    return vim.fn.isdirectory('.git') == 1
end

function M.opts()
    return {
        signs = {
            add          = { text = '┃' },
            change       = { text = '┃' },
            delete       = { text = '_' },
            topdelete    = { text = '‾' },
            changedelete = { text = '~' },
            untracked    = { text = '┆' },
        },
        signs_staged = {
            add          = { text = '┃' },
            change       = { text = '┃' },
            delete       = { text = '_' },
            topdelete    = { text = '‾' },
            changedelete = { text = '~' },
            untracked    = { text = '┆' },
        },
        current_line_blame = true, -- Show current line's Git blame
    }
end

function M.config()
    require('gitsigns').setup()
end

return M
