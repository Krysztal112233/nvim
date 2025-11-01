local M = {}

function M.config()
    require("barbar").setup({
        auto_hide = false,
        tabpages = true,
        icons = {
            -- Add diagnostics to tab bar
            diagnostics = {
                [vim.diagnostic.severity.ERROR] = { enabled = true },
                [vim.diagnostic.severity.WARN] = { enabled = false },
                [vim.diagnostic.severity.INFO] = { enabled = false },
                [vim.diagnostic.severity.HINT] = { enabled = true },
            },
        },
    })

    local map = vim.keymap.set
    local opts = { noremap = true, silent = true }

    -- Move to previous/next
    map({ "n", "v" }, "<A-,>", "<Cmd>BufferPrevious<CR>", opts)
    map({ "n", "v" }, "<A-.>", "<Cmd>BufferNext<CR>", opts)
end

function M.init()
    vim.g.barbar_auto_setup = false -- disable auto-setup
end

return M
