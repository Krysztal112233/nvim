return {
    -- Render for markdown
    {
        "MeanderingProgrammer/render-markdown.nvim",
        opts = require("config.core.render-markdown").opts,
        lazy = true,
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        ft = { "md", "markdown" },
    },
}
