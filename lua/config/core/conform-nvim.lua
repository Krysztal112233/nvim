local M = {}

function M.opts()
    return {
        formatters_by_ft = {
            c = { "clang_format", lsp_format = "fallback" },
            cmake = { lsp_format = "fallback" },
            cpp = { "clang_format", lsp_format = "fallback" },
            dockerfile = { lsp_format = "fallback" },
            go = { "goimports", "gofmt" },
            javascript = { "deno_fmt", "prettier" },
            json = { "deno_fmt" },
            lua = { "stylua", lsp_format = "fallback" },
            markdown = { "deno_fmt" },
            rust = { "rustfmt", lsp_format = "fallback" },
            scala = { lsp_format = "fallback" },
            sh = { "shfmt", lsp_format = "fallback" },
            toml = { lsp_format = "fallback" },
            yaml = { lsp_format = "fallback" },
        },
    }
end

function M.config()
    require("conform").setup(M.opts())
end

return M
