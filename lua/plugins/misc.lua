return {
    { "folke/tokyonight.nvim" },
    { "loctvl842/monokai-pro.nvim" },
    { "kaicataldo/material.vim" },

    {
        "rebelot/kanagawa.nvim", -- neorg needs a colorscheme with treesitter support
        config = function()
            vim.cmd.colorscheme("kanagawa")
        end,
    },
}
