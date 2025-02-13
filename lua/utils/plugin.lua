local M = {}

--- @param plugin string
--- @return boolean
function M.is_loaded(plugin)
    return require("lazy.core.config").plugins[plugin]._.loaded ~= nil
end

return M
