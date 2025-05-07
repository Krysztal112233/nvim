return {
    { "folke/tokyonight.nvim" },
    { "loctvl842/monokai-pro.nvim" },
    { "kaicataldo/material.vim" },

    {
        "mfussenegger/nvim-lint",
        event = { "BufReadPre", "BufNewFile" },
        config = require("config.core.nvim-lint").config,
    },
}
