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

    -- Just support
    {
        "IndianBoy42/tree-sitter-just",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            ---@diagnostic disable-next-line: inject-field
            require("nvim-treesitter.parsers").get_parser_configs().just = {
                install_info = {
                    url = "https://github.com/IndianBoy42/tree-sitter-just", -- local path or git repo
                    files = { "src/parser.c", "src/scanner.c" },
                    branch = "main",
                },
                maintainers = { "@IndianBoy42" },
            }
        end,
    },

    -- Java support via nvim-jdtls
    {
        "mfussenegger/nvim-jdtls",
        lazy = true,
        ft = { "java", "gradle" }
    },

    -- Extra Golang support
    {
        "crispgm/nvim-go",
        lazy = true,
        ft = { "go" },
    },
}
