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
}
