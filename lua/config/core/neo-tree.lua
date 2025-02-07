local M = {}


function M.config()
    require("neo-tree").setup({
        popup_border_style = "rounded",
        default_component_configs = {
            git_status = {
                symbols = {
                    added = "",
                    deleted = "",
                    renamed = "",
                    untracked = "",
                    ignored = "",
                    unstaged = "",
                    staged = "",
                    conflict = "",
                },
            },
        },
        filesystem = {
            follow_current_file = {
                enabled = true,
            },
        }
    })
end

return M
