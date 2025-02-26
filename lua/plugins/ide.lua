return {
    -- Auto completion
    {
        "hrsh7th/nvim-cmp",
        event = { "InsertEnter", "CmdlineEnter" },
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-vsnip",

            "rafamadriz/friendly-snippets",
            "onsails/lspkind.nvim",
            "hrsh7th/vim-vsnip",
        },
        opts = require("config.core.nvim-cmp").opts,
        config = require("config.core.nvim-cmp").config,
    },

    -- Mason
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = require("config.core.mason").config,
    },

    -- Mason lsp config
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "neovim/nvim-lspconfig",
        },
        config = require("config.core.mason-lspconfig").config,
    },

    -- nvim lsp-config
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
        },
        lazy = false,
        config = require("config.core.nvim-lspconfig").config,
    },

    -- formatting
    {
        "stevearc/conform.nvim",
        lazy = true,
        event = "VeryLazy",
        config = require("config.core.conform-nvim").config,
        ft = vim.tbl_keys(require("config.core.conform-nvim").opts().formatters_by_ft),
    },

    -- Debugger
    {
        "mfussenegger/nvim-dap",
        config = require("config.core.dap.nvim-dap").config,
    },

    -- Symbol navigator
    {
        "SmiteshP/nvim-navbuddy",
        dependencies = {
            "neovim/nvim-lspconfig",
            "SmiteshP/nvim-navic",
            "MunifTanjim/nui.nvim",
            "nvim-telescope/telescope.nvim",
        },
        opts = require("config.core.navbuddy").opts,
    },

    -- IDE like text wrapping
    {
        "SmiteshP/nvim-navic",
        dependencies = "neovim/nvim-lspconfig",
        opts = require("config.core.nvim-navic").opts,
    },
}
