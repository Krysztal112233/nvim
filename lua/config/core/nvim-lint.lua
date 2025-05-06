local M = {}

function M.config()
    local lint = require("lint")
    lint.linters_by_ft = {
        markdown = { "deno", "cspell" },
        json = { "deno" },
        text = { "cspell" },
    }

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        group = lint_augroup,
        callback = function()
            if vim.opt_local.modifiable:get() then
                lint.try_lint()
            end
        end,
    })
end

return M
