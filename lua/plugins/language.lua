return {
    -- Rust
    {
        "mrcjkb/rustaceanvim",
        lazy = false,
        config = require("config.core.language.rustaceanvim").config,
    },

    -- Visual lifetime explore
    {
        "cordx56/rustowl",
        dependencies = { "neovim/nvim-lspconfig" },
        ft = { "rust", "rs" },
        config = require("config.core.language.rustowl").config,
    },

    -- ScalaMetals
    {
        "scalameta/nvim-metals",
        opts = require("config.core.language.nvim-metals").opts,
        config = require("config.core.language.nvim-metals").config,
    },

    -- Cland extra
    {
        "p00f/clangd_extensions.nvim",
        lazy = true,
        ft = { "c", "cpp", "h", "hpp" },
        config = require("config.core.language.clangd_ext").config,
        opts = require("config.core.language.clangd_ext").opts,
    },
}
