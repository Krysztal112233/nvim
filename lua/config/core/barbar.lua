local M = {}

function M.config()
    require("barbar").setup {
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

            -- Add git signs to tab bar
            gitsigns = {
                added = { enabled = true, icon = '+' },
                changed = { enabled = true, icon = '~' },
                deleted = { enabled = true, icon = '-' },
            },
        }
    }

    local map = vim.keymap.set
    local opts = { noremap = true, silent = true }

    -- Move to previous/next
    map({ "n", "v" }, '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
    map({ "n", "v" }, '<A-.>', '<Cmd>BufferNext<CR>', opts)

    -- Re-order to previous/next
    map({ "n", "v" }, '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
    map({ "n", "v" }, '<A->>', '<Cmd>BufferMoveNext<CR>', opts)

    map({ "n", "v" }, '<C-w>', '<Cmd>BufferClose<CR>', opts)
end

function M.init()
    vim.g.barbar_auto_setup = false         -- disable auto-setup
end

return M
