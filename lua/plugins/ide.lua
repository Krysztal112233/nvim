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
        },
        opts = require("config.core.navbuddy").opts,
    },

    -- IDE like text wrapping
    {
        "SmiteshP/nvim-navic",
        dependencies = "neovim/nvim-lspconfig",
        opts = require("config.core.nvim-navic").opts,
    },

    -- Trouble
    {
        "folke/trouble.nvim",
        cmd = "Trouble",
        opts = {},
        keys = {
            {
                "<leader>tt",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Diagnostics (Trouble)",
            },
            {
                "<leader>tT",
                "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                desc = "Buffer Diagnostics (Trouble)",
            },
            {
                "<leader>tQ",
                "<cmd>Trouble qflist toggle<cr>",
                desc = "Quickfix List (Trouble)",
            },
        },
    },
}
