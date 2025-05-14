return {
    { "folke/tokyonight.nvim" },
    { "loctvl842/monokai-pro.nvim" },

    {
        "rebelot/kanagawa.nvim", -- neorg needs a colorscheme with treesitter support
        config = function()
            vim.cmd.colorscheme("kanagawa")
        end,
    },
}
