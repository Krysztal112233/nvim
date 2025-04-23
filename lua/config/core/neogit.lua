local M = {}

function M.opts()
    return {
        kind = "floating",
        signs = {
            hunk = { "", "" },
            item = { "", "" },
            section = { "", "" },
        },
        sections = {
            recent = {
                folded = false,
            },
        }
    }
end

function M.config()
    require("neogit").setup(M.opts())
end

return M
