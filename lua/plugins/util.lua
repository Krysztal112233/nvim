return {
    -- Floating terminal
    { 'akinsho/toggleterm.nvim', lazy = false,       config = true },

    -- `which-key`, powerful command prompt
    { "folke/which-key.nvim",    event = "VeryLazy", },

    -- Text input modification
    {
        "stevearc/dressing.nvim",
        lazy = false,
        config = function()
            require("dressing").setup({})
        end
    },

    -- Tab bar
    {
        'romgrk/barbar.nvim',
        event = "VeryLazy",
        dependencies = {
            'lewis6991/gitsigns.nvim',     -- for git status
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
                        [vim.diagnostic.severity.ERROR] = { enabled = true },
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

            local map = vim.keymap.set
            local opts = { noremap = true, silent = true }

            -- Move to previous/next
            map({ "n", "v" }, '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
            map({ "n", "v" }, '<A-.>', '<Cmd>BufferNext<CR>', opts)

            -- Re-order to previous/next
            map({ "n", "v" }, '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
            map({ "n", "v" }, '<A->>', '<Cmd>BufferMoveNext<CR>', opts)

            map({ "n", "v" }, '<C-w>', '<Cmd>BufferClose<CR>', opts)
        end
    },

    -- powerful panel
    {
        "nvim-telescope/telescope.nvim",
        lazy = true,
        dependencies = { 'nvim-lua/plenary.nvim' },
        event = "BufEnter"
    },

    -- Extensible UI for Neovim notifications and LSP progress messages.
    {
        "j-hui/fidget.nvim",
        config = true
    },

    -- Auto pair
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true
    },

    -- Git status
    -- While current workspace contains `.git` directory
    {
        "lewis6991/gitsigns.nvim",
        cond = function()
            return vim.fn.isdirectory('.git') == 1
        end,
        config = function()
            require('gitsigns').setup {
                signs = {
                    add          = { text = '+' },
                    change       = { text = '~' },
                    delete       = { text = '_' },
                    topdelete    = { text = '‾' },
                    changedelete = { text = '~' },
                },
                current_line_blame = true, -- Show current line's Git blame
            }
        end
    },

    -- Surrounding modification
    {
        "echasnovski/mini.surround",
        event = { "BufEnter" },
        config = function()
            require('mini.surround').setup()
        end
    },

    -- Comment util
    {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup({})
        end
    },

    -- Symbol/word highlighter
    {
        "RRethy/vim-illuminate",
        config = function()
            require("illuminate").configure({
                opts = {
                    providers = {
                        'lsp',
                        'treesitter',
                        'regex',
                    },
                }
            })
        end
    },

    -- Bookmarks
    {
        "chentoast/marks.nvim",
        event = "VeryLazy",
        opts = {},
    },

    -- Multi cursor
    {
        "mg979/vim-visual-multi",
        lazy = true,
        event = "VimEnter"
    },

    -- Lualine for beautiful display
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = function()
            local opts = {
                options = {
                    theme = "auto",
                    globalstatus = true,
                    disabled_filetypes = { statusline = { "dashboard", "alpha", "ministarter", "snacks_dashboard" } },
                    extensions = { "quickfix" }
                },
            }
            return opts
        end
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
        opts = {
            auto_install = true,
            highlight = {
                enable = true,
            },
            ensure_installed = {
                "go",
                "bash",
                "gleam",
                "c",
                "diff",
                "javascript",
                "jsdoc",
                "json",
                "jsonc",
                "lua",
                "luadoc",
                "luap",
                "markdown",
                "markdown_inline",
                "python",
                "query",
                "regex",
                "toml",
                "typescript",
                "vim",
                "vimdoc",
                "yaml",
            },
        },
        config = function(opts)
            require("nvim-treesitter.configs").setup(opts)
        end
    },

    -- Snip
    {
        "L3MON4D3/LuaSnip",
        dependencies = { "rafamadriz/friendly-snippets" },
        build = "make install_jsregexp",
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
        end
    },

    -- ALE for spell check
    {
        "dense-analysis/ale",
        config = function()
            -- Configuration goes here.
            local g = vim.g

            g.ale_ruby_rubocop_auto_correct_all = 1

            g.ale_linters = {
                ruby = { "rubocop", "ruby" },
                lua = { "lua_language_server" },
                gleam = { "gleam" },
                rust = { "rust_analyzer" },
                go = { "gopls" }
            }
        end
    },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
        },
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        }
    },
}
