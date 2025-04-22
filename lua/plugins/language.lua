return {
    -- Rust
    {
        "mrcjkb/rustaceanvim",
        lazy = false,
        config = require("config.core.language.rustaceanvim").config,
    },

    -- ScalaMetals
    {
        "scalameta/nvim-metals",
        opts = require("config.core.language.nvim-metals").opts,
        config = require("config.core.language.nvim-metals").config,
    },

    -- Clangd extra
    {
        "p00f/clangd_extensions.nvim",
        lazy = true,
        ft = { "c", "cpp", "h", "hpp" },
        config = require("config.core.language.clangd_ext").config,
        opts = require("config.core.language.clangd_ext").opts,
    },

    -- Java support
    {

        "nvim-java/nvim-java",
        dependencies = {
            "nvim-java/lua-async-await",
            "nvim-java/nvim-java-refactor",
            "nvim-java/nvim-java-core",
            "nvim-java/nvim-java-test",
            "nvim-java/nvim-java-dap",
            "MunifTanjim/nui.nvim",
            "neovim/nvim-lspconfig",
            "mfussenegger/nvim-dap",
            {
                "williamboman/mason.nvim",
                opts = {
                    registries = {
                        "github:nvim-java/mason-registry",
                        "github:mason-org/mason-registry",
                    },
                },
            },
            {
                "williamboman/mason-lspconfig.nvim",
                opts = {
                    handlers = {
                        ["jdtls"] = function()
                            require("java").setup()
                            require("lspconfig").jdtls.setup() -- Add this line for using the wrapped jdtls.setup
                        end,
                    },
                },
            },
        },
        opts = {},
    },

    -- Just support
    {
        "IndianBoy42/tree-sitter-just",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require("nvim-treesitter.parsers").get_parser_configs().just = {
                install_info = {
                    url = "https://github.com/IndianBoy42/tree-sitter-just", -- local path or git repo
                    files = { "src/parser.c", "src/scanner.c" },
                    branch = "main",
                    -- use_makefile = true -- this may be necessary on MacOS (try if you see compiler errors)
                },
                maintainers = { "@IndianBoy42" },
            }
        end,
    },
}
