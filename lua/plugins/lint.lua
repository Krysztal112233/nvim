return {
    {
        "mfussenegger/nvim-lint",
        event = { "BufReadPre", "BufNewFile" },
        config = require("config.core.nvim-lint").config,
    },
}
