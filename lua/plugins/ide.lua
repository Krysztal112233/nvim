return {
    -- Auto completion
    {
        "saghen/blink.cmp",
        dependencies = "rafamadriz/friendly-snippets",
        version = "*",
        opts = require("config.core.blink-cmp").opts,
        opts_extend = { "sources.default" },
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
        opts = {
            handlers = {
                ["jdtls"] = function()
                    require("java").setup()
                    require("lspconfig").jdtls.setup() -- Add this line for using the wrapped jdtls.setup
                end,
            },
        },
    },

    -- nvim lsp-config
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "nvim-java/nvim-java",
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

    -- IDE like text wrapping
    {
        "SmiteshP/nvim-navic",
        dependencies = "neovim/nvim-lspconfig",
        opts = require("config.core.nvim-navic").opts,
    },
}
