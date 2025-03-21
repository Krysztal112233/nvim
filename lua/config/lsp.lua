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
    neocmake = {},
    pylsp = {},
    rust_analyzer = {},
    taplo = {},
    vtsls = {},
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
    volar = {
        init_options = {
            vue = {
                hybridMode = true,
            },
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
    "lua_ls",
    "neocmake",
    "pylsp",
    "rust_analyzer",
    "taplo",
    "volar",
    "yamlls",
}

M.servers_skip_config = {
    "jdtls",
    "rustowl",
    "rust_analyzer",
}

-- Managed by mason-lspconfig
M.mason_lspconfig = {
    ensure_installed = M.mason_lspconfig,
    automatic_installation = true,
}

return M
