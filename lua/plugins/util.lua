return {
    -- Floating terminal
    { 'akinsho/toggleterm.nvim', lazy = false,       config = true },

    -- `which-key`, powerful command prompt
    { "folke/which-key.nvim",    event = "VeryLazy", },

    -- Text input modification
    { "stevearc/dressing.nvim",  lazy = false },

    -- Tab bar
    {
        'romgrk/barbar.nvim',
        event = "VeryLazy",
        dependencies = {
            'lewis6991/gitsigns.nvim', -- for git status
            'nvim-tree/nvim-web-devicons', -- for file icons
        },

        -- Disable auto setup
        init = function()
            vim.g.barbar_auto_setup = false -- disable auto-setup
        end,

        -- Custom `babar`
        config = function()
            require("barbar").setup {
                auto_hide = false,
                tabpages = true,
                icons = {
                    -- Add diagnostics to tab bar
                    diagnostics = {
                        [vim.diagnostic.severity.ERROR] = { enabled = true, icon = 'ﬀ' },
                        [vim.diagnostic.severity.WARN] = { enabled = false },
                        [vim.diagnostic.severity.INFO] = { enabled = false },
                        [vim.diagnostic.severity.HINT] = { enabled = true },
                    },

                    -- Add git signs to tab bar
                    gitsigns = {
                        added = { enabled = true, icon = '+' },
                        changed = { enabled = true, icon = '~' },
                        deleted = { enabled = true, icon = '-' },
                    },
                }
            }
        end
    },

    -- Fuzzy file finder
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
    },

    -- Extensible UI for Neovim notifications and LSP progress messages.
    {
        "j-hui/fidget.nvim",
        config = true
    },

    -- Auto pair
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
    },
}
