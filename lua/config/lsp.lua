local M = {}

-- Enabled LSP managed by nvim-lspconfig, mason-lspconfig
M.servers = {
    ols = {},
    bashls = {},
    ts_ls = {},
    volar = {},
    rust_analyzer = {},
    jsonls = {},
    taplo = {},
    jdtls = {},
    yamlls = {},
    gopls = {},
    lua_ls = {
        Lua = {
            -- Settings for nvim completion
            diagnostics = { globals = { "vim" } },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = { enable = false },
        },
    },
}


M.servers_skip_install = {}

M.servers_skip_config = {
    "rust_analyzer"
}

-- Managed by mason-lspconfig
M.mason_lspconfig = {
    ensure_installed = vim.tbl_keys(M.servers),
    automatic_installation = true,
}

-- Markdown file type
M.markdown_file_type = { "markdown", "md" }

-- Scala file type
M.scala_file_type = { "scala", "sbt", "java" }

-- Lua file type
M.lua_file_type = { "lua" }

-- Go file type
M.go_file_type = { "go" }

M.json_file_type = { "json" }

-- Completion sources
M.cmp_sources = {
    { name = "nvim_lsp" },
    { name = "path" },
}

return M
