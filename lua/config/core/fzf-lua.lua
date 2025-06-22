local M = {}

function M.config()
    require("fzf-lua").setup({ winopts = { preview = { default = "bat" } } })
    vim.cmd(":FzfLua register_ui_select")
end

return M
