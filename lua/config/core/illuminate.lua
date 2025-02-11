local M = {}

function M.opts()
    return {
        delay = 200,
        large_file_cutoff = 2000,
        large_file_overrides = {
            providers = { "lsp" },
        },
    }
end

function M.config(_, opts)
    require("illuminate").configure(opts)
end

return M
