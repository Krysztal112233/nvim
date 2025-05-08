return {
    -- Floating terminal
    {
        "akinsho/toggleterm.nvim",
        lazy = false,
        config = true
    },

    -- `which-key`, powerful command prompt
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = require("config.core.which-key").opts
    },

    -- lazy.nvim
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
        },
        config = require("config.core.noice").config
    },

    {
        "rcarriga/nvim-notify",
        config = function()
            require("notify").setup({
                background_colour = "#000000",
            })
        end
    },


    -- Tab bar
    {
        "romgrk/barbar.nvim",
        event = "VeryLazy",
        dependencies = {
            "lewis6991/gitsigns.nvim",     -- for git status
            "nvim-tree/nvim-web-devicons", -- for file icons
        },

        -- Disable auto setup
        init = require("config.core.barbar").init,

        -- Custom `babar`
        config = require("config.core.barbar").config,
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
        opts = require("config.core.gitsigns").opts,
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

    -- Lualine for beautiful display
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = require("config.core.lualine").opts,
    },

    -- treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
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

    -- neotree
    {
        "nvim-neo-tree/neo-tree.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        config = require("config.core.neo-tree").config,
    },

    -- some tweaks for nvim
    {
        "folke/snacks.nvim",
        opts = require("config.core.snacks").opts,
    },

    -- Fast navigation
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        keys = require("config.core.flash").keys,
    },

    -- Scrollbar
    {
        "petertriho/nvim-scrollbar",
        config = require("config.core.scroll").config,
    },

    -- Rename preview
    {
        "smjonas/inc-rename.nvim",
        config = require("config.core.inc-rename").config,
    },

    -- Powerufl pannel
    {
        "ibhagwan/fzf-lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = require("config.core.fzf-lua").config
    },

    -- Powerful git
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "sindrets/diffview.nvim",
            "ibhagwan/fzf-lua",
        },
        config = require("config.core.neogit").config
    },

    -- async linter tool
    {
        "mfussenegger/nvim-lint",
        event = { "BufReadPre", "BufNewFile" },
        config = require("config.core.nvim-lint").config,
    },

    -- Neorg
    {
        "nvim-neorg/neorg",
        dependencies = {
            "benlubas/neorg-interim-ls"
        },
        lazy = false,
        config = require("config.core.neorg").config
    }
}
