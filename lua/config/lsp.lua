local M = {}

M.ensure_install = {
    "bashls",
    "clangd",
    "denols",
    "dockerls",
    "gopls",
    "jdtls",
    "jsonls",
    "lua_ls",
    "neocmake",
    "pylsp",
    "rust_analyzer",
    "taplo",
    "volar",
    "yamlls",
}

M.override_handles = {
    ["lua_ls"] = function()
        local cfg = {
            settings = {
                Lua = {
                    diagnostics = { globals = { "vim" } },
                    workspace = {
                        library = vim.api.nvim_get_runtime_file("", true),
                    },
                    telemetry = { enable = false },
                },
            },
        }

        vim.lsp.enable("lua_ls")
        vim.lsp.config("lua_ls", cfg)
    end,
    ["rust_analyzer"] = function() end,
    ["jdtls"] = function() end
}


return M
