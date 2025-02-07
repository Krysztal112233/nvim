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
            "williamboman/mason.nvim"
        },
        config = require("config.core.mason-lspconfig").config,
    },

    -- nvim lsp config
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim"
        },
        lazy = false,
        config = require("config.core.nvim-lspconfig").config,
    },

    -- Rename preview
    {
        "smjonas/inc-rename.nvim",
        config = require("config.core.inc-rename").config,
    },

    -- -- Helper: Rust Analyzer
    {
        "mrcjkb/rustaceanvim",
        lazy = false,
        config = require("config.core.language.rustaceanvim").config,
    },

    -- Special: ScalaMetals
    {
        "scalameta/nvim-metals",

        opts = require("config.core.language.nvim-metals").opts,
        config = require("config.core.language.nvim-metals").config,
    },

    -- Debugger
    {
        "mfussenegger/nvim-dap",
        config = require("config.core.dap.nvim-dap").config,
    },

    -- Symbol outlines
    {
        "hedyhli/outline.nvim",
        lazy = true,
        cmd = { "Outline", "OutlineOpen" },
        opts = require("config.core.sym-outline").opts,
        config = require("config.core.sym-outline").config,
    },
}
