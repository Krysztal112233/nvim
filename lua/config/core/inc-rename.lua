local M = {}

function M.config()
    require("inc_rename").setup({
        input_buffer_type = "dressing",
    })
end

return M
