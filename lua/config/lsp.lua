local M = {}

-- Enabled LSP managed by nvim-lspconfig, mason-lspconfig
M.servers = {
    bashls = {},
    clangd = {},
    denols = {},
    dockerls = {},
    gopls = {},
    jdtls = {},
    jsonls = {},
    ols = {},
    pylsp = {},
    rust_analyzer = {},
    taplo = {},
    volar = {},
    yamlls = {},
    lua_ls = {
        Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = { enable = false },
        },
    },
}

M.mason_extra = {}

M.servers_skip_config = {
    "rust_analyzer",
}

-- Managed by mason-lspconfig
M.mason_lspconfig = {
    ensure_installed = vim.list_extend(vim.tbl_keys(M.servers), M.mason_extra),
    automatic_installation = true,
}

return M
