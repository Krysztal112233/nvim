local utils = require "utils"
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
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
        },
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")

            cmp.setup({
                -- Add snippet from LuaSnip
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },

                -- Enable `ghost_text`
                -- For completion preview
                experimental = {
                    ghost_text = true,
                },

                -- Setting order of completion sources
                sources = require("config.lsp").cmp_sources,

                -- lunar schema
                mapping = {
                    ['<CR>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            if luasnip.expandable() then
                                luasnip.expand()
                            else
                                cmp.confirm({
                                    select = true,
                                })
                            end
                        else
                            fallback()
                        end
                    end),

                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.locally_jumpable(1) then
                            luasnip.jump(1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),

                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.locally_jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                },
            })
        end,
    },

    -- Mason
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = function()
            require("mason").setup()
        end
    },

    -- Mason lsp config
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "williamboman/mason.nvim"
        },
        config = function()
            local lsp_config = require("config.lsp").mason_lspconfig

            require("mason-lspconfig").setup {
                ensure_installed = lsp_config.ensure_installed,
                automatic_installation = lsp_config.ensure_installed,
            }
        end
    },

    -- nvim lsp config
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim"
        },
        lazy = false,

        config = function()
            local servers = require("config.lsp").servers
            for server, config in pairs(servers) do
                if require("utils").contains(require("config.lsp").servers_skip_config, server) == true then
                    goto continue
                end

                require("lspconfig")[server].setup({
                    settings = config,
                })
                ::continue::
            end
        end
    },

    -- Helper: Rust Analyzer
    {
        "mrcjkb/rustaceanvim",
        lazy = false,
        config = function()
            vim.g.rustaceanvim = {
                tools = {},
                server = {
                    on_attach = function(client, bufnr)
                        -- you can also put keymaps in here
                    end,
                    default_settings = {
                        -- rust-analyzer language server configuration
                        ['rust-analyzer'] = {},
                    },
                },
                dap = {},
            }
        end
    },

    -- Special: ScalaMetals
    {
        "scalameta/nvim-metals",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "j-hui/fidget.nvim",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-vsnip",
            "hrsh7th/vim-vsnip",
        },

        opts = function()
            -- Initialized basic nvim-metals configuration
            local metals_config = require("metals").bare_config()
            metals_config.init_options.statusBarProvider = "off"
            metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- On attach function
            metals_config.on_attach = function(client, bufnr)
                require("metals").setup_dap()
            end

            return metals_config
        end,
        config = function(_, metals_config)
            local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
            vim.api.nvim_create_autocmd("FileType", {
                pattern = require("config.lsp").scala_file_type,
                callback = function()
                    require("metals").initialize_or_attach(metals_config)
                end,
                group = nvim_metals_group,
            })
        end,
    },

    -- Debugger
    {
        "mfussenegger/nvim-dap",
        config = function(self)
            -- Debug settings if you're using nvim-dap
            local dap = require("dap")
            dap.configurations.scala = require("config.debugger").scala
        end
    },

    -- Symbol outlines
    {
        "hedyhli/outline.nvim",
        lazy = true,
        cmd = { "Outline", "OutlineOpen" },
        opts = {
            preview_window = {
                winhl = "NormalFloat:",
            },
            -- Your setup opts here
        },
        config = function()
            require("outline").setup({})
        end
    },

    -- Signature hovering
    {
        "ray-x/lsp_signature.nvim",
        event = "VeryLazy",
        opts = {},
        config = function(_, opts) require 'lsp_signature'.setup(opts) end
    },
}
