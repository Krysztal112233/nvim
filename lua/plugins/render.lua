return {
    -- Render for markdown
    {
        'MeanderingProgrammer/render-markdown.nvim',
        lazy = true,
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
        ft = require("config.lsp").markdown_file_type,
        opts = {},
    }
}
