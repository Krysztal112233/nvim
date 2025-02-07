local M = {}

function M.config()
    require("illuminate").configure({
        opts = {
            providers = {
                'lsp',
                'treesitter',
            },
        }
    })
end

return M
