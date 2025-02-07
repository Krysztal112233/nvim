local M = {}

function M.config()
    require("nvim-tree").setup({
        view = {
            side = "left",     -- Show at left
            width = 30,        -- Set default width
        },
        renderer = {
            group_empty = true,
        },
        actions = {
            open_file = {
                quit_on_open = false,
            },
        },
        hijack_cursor = true,

        -- Disable diagnostic window
        diagnostics = {
            enable = false,
        },

        -- Disable log window
        log = {
            enable = false,
        },
    })

    -- Auto open `nvim-tree` while start
    local function open_nvim_tree()
        if vim.fn.argc() == 0 then
            require("nvim-tree.api").tree.open()
        end
    end

    -- Disable netrw(advice by nvim-tree)
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    vim.api.nvim_create_autocmd("VimEnter", {
        callback = open_nvim_tree,
    })
end

return M
