local M = {}

-- Enabled LSP managed by nvim-lspconfig, mason-lspconfig
M.lspconfig = {
    bashls = {},
    clangd = {},
    denols = {},
    dockerls = {},
    gopls = {},
    jdtls = {},
    jsonls = {},
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

M.mason_lspconfig = {
    "bashls",
    "clangd",
    "denols",
    "dockerls",
    "gopls",
    "jdtls",
    "jsonls",
    "pylsp",
    "rust_analyzer",
    "taplo",
    "volar",
    "yamlls",
    "lua_ls",
}

M.servers_skip_config = {
    "rustowl",
    "rust_analyzer",
}

-- Managed by mason-lspconfig
M.mason_lspconfig = {
    ensure_installed = M.mason_lspconfig,
    automatic_installation = true,
}

return M
