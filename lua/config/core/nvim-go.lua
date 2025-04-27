local M = {}


function M.opts()
    return {}
end

function M.config()
    require("go").setup(M.opts())
end

return M
