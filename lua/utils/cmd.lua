local M = {}

---@param cmd string
---@return boolean
function M.is_executable_exist(cmd)
    return vim.fn.executable(cmd) == 1
end

return M
