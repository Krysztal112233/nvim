return {
    -- Render for markdown
    {
        "MeanderingProgrammer/render-markdown.nvim",
        lazy = true,
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        ft = { "md", "markdown" },
    }
}
