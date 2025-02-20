local M = {}

function M.config()
    local remapping = vim.keymap.set

    require("lspconfig").rustowl.setup({
        trigger = {
            hover = false,
        },
    })

    remapping({ "n", "v" }, "<A-o>", require("rustowl").rustowl_cursor, { noremap = true, silent = true })

    vim.notify("Rustowl loaded!")
end

return M
