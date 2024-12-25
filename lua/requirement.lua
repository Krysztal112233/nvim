-- System requirement checking

local model = {}

local requirements = {
    "git",
    "rg",
    "lazygit"
}

local function ensure_exist(binary)
    if vim.fn.executable(binary) == 0 then
        vim.api.nvim_err_writeln("Required binary `" .. binary .. "` is not installed!")
        vim.cmd("quit")
    end
end

function model.ensure()
    for index = 1, #requirements do
        ensure_exist(requirements[index])
    end
end

return model
