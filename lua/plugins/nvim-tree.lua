-- nvim-tree configurations, it;s much complex
return {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },

    config = require("config.core.nvim-tree").config,
}
