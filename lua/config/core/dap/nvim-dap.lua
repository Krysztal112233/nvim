local M = {}

function M.config(_)
    -- Debug settings if you're using nvim-dap
    local dap = require("dap")
    dap.configurations.scala = require("config.debugger").scala
end

return M
