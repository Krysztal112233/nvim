local M = {}

function M.config()
    require("illuminate").configure({
        opts = {
            providers = {
                'lsp',
                'treesitter',
                'regex',
            },
        }
    })
end

return M
