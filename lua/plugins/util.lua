return {
    -- Floating terminal
    { "akinsho/toggleterm.nvim", lazy = false, config = true },

    -- `which-key`, powerful command prompt
    { "folke/which-key.nvim", event = "VeryLazy" },

    -- Text input modification
    {
        "stevearc/dressing.nvim",
        lazy = false,
        config = require("config.core.dressing").config,
    },

    -- Tab bar
    {
        "romgrk/barbar.nvim",
        event = "VeryLazy",
        dependencies = {
            "lewis6991/gitsigns.nvim", -- for git status
            "nvim-tree/nvim-web-devicons", -- for file icons
        },

        -- Disable auto setup
        init = require("config.core.barbar").init,

        -- Custom `babar`
        config = require("config.core.barbar").config,
    },

    -- powerful panel
    {
        "nvim-telescope/telescope.nvim",
        lazy = true,
        dependencies = { "nvim-lua/plenary.nvim" },
        event = "BufEnter",
    },

    -- Extensible UI for Neovim notifications and LSP progress messages.
    {
        "j-hui/fidget.nvim",
        config = true,
    },

    -- Auto pair
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true,
    },

    -- Git status
    -- While current workspace contains `.git` directory
    {
        "lewis6991/gitsigns.nvim",
        cond = require("config.core.gitsigns").cond,
        config = require("config.core.gitsigns").config,
    },

    -- Surrounding modification
    {
        "echasnovski/mini.surround",
        event = { "BufEnter" },
        config = require("config.core.mini.surround").config,
    },

    -- Comment util
    {
        "numToStr/Comment.nvim",
        config = require("config.core.comment").config,
    },

    {
        "RRethy/vim-illuminate",
        opts = require("config.core.illuminate").opts,
        config = require("config.core.illuminate").config,
    },

    -- Bookmarks
    {
        "chentoast/marks.nvim",
        event = "VeryLazy",
    },

    -- Multi cursor
    {
        "mg979/vim-visual-multi",
        lazy = true,
        event = "VimEnter",
    },

    -- Lualine for beautiful display
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = require("config.core.lualine").opts,
    },

    -- Lazy git into nvim
    {

        "kdheepak/lazygit.nvim",
        lazy = true,
        cmd = {
            "LazyGit",
            "LazyGitConfig",
            "LazyGitCurrentFile",
            "LazyGitFilter",
            "LazyGitFilterCurrentFile",
        },
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },

    -- treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
        opts = require("config.core.treesitter").opts,
        config = require("config.core.treesitter").config,
    },

    {
        "L3MON4D3/LuaSnip",
        build = "make install_jsregexp",
    },

    -- Colorful pair
    {
        "hiphish/rainbow-delimiters.nvim",
        config = require("config.core.rainbow").config,
    },

    -- noice nvim for better view
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
        config = require("config.core.noice").config,
    },

    -- neotree
    {
        "nvim-neo-tree/neo-tree.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        },
        config = require("config.core.neo-tree").config,
    },

    {
        "folke/snacks.nvim",
        opts = require("config.core.snacks").opts,
    },

    {
        "folke/flash.nvim",
        event = "VeryLazy",
        opts = require("config.core.flash").opts,
        keys = require("config.core.flash").keys,
    },

    {
        "tpope/vim-repeat",
    },
}
