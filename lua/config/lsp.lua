local module = {}

-- Enabled LSP managed by nvim-lspconfig, mason-lspconfig
module.servers = {
    bashls = {},
    ts_ls = {},
    volar = {},
    rust_analyzer = {
        imports = {
            granularity = {
                group = "module",
            },
            prefix = "self",
        },
        cargo = {
            buildScripts = {
                enable = true,
            },
        },
        procMacro = {
            enable = true
        },
        inlayHints = {
            bindingModeHints = { enable = true },
            closureCaptureHints = { enable = true },
            genericParameterHints = { type = { enable = true } },
        },
    },
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

-- Managed by mason-lspconfig
module.mason_lspconfig = {
    ensure_installed = vim.tbl_keys(module.servers),
    automatic_installation = true,
}

-- Markdown file type
module.markdown_file_type = { "markdown", "md" }

-- Scala file type
module.scala_file_type = { "scala", "sbt", "java" }

-- Lua file type
module.lua_file_type = { "lua" }

-- Go file type
module.go_file_type = { "go" }

module.json_file_type = { "json" }

-- Completion sources
module.cmp_sources = {
    { name = "nvim_lsp" },
    { name = "path" },
}

return module
