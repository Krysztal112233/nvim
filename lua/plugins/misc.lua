return {
    { "folke/tokyonight.nvim" },
    { "loctvl842/monokai-pro.nvim" },


    {
        "mfussenegger/nvim-lint",
        event = { "BufReadPre", "BufNewFile" },
        config = require("config.core.nvim-lint").config,
    },


    {
        "nvim-neorg/neorg",
        dependencies = {
            "benlubas/neorg-interim-ls"
        },
        lazy = false,
        version = "*",
        config = require("config.core.neorg").config
    }
}
