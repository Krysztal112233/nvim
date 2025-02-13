local M = {}

---@param cmd string
---@return boolean
function M.is_cmd_exist(cmd)
    return vim.fn.executable(cmd) == 1
end

return M
