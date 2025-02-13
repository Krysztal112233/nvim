local M = {}

function M.opts()
    return {
        formatters_by_ft = {
            dockerfile = { lsp_format = "fallback" },
            go = { "goimports", "gofmt" },
            javascript = { "deno_fmt", "prettier" },
            json = { "deno_fmt" },
            lua = { "stylua", lsp_format = "fallback" },
            markdown = { "deno_fmt" },
            rust = { "rustfmt", lsp_format = "fallback" },
            sh = { "shfmt", lsp_format = "fallback" },
            toml = { lsp_format = "fallback" },
        },
    }
end

function M.config()
    require("conform").setup(M.opts())
end

return M
