local M = {}

function M.config()
    require("fzf-lua").setup({ winopts = { preview = { default = "bat" } } })
end

return M
