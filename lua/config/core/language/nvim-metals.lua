local M = {}

function M.opts()
    -- Initialized basic nvim-metals configuration
    local metals_config = require("metals").bare_config()
    metals_config.init_options.statusBarProvider = "off"
    metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- On attach function
    metals_config.on_attach = function(_, _)
        require("metals").setup_dap()
    end

    metals_config.settings = {
        inlayHints = {
            hintsInPatternMatch = { enable = true },
            implicitArguments = { enable = true },
            implicitConversions = { enable = true },
            inferredTypes = { enable = true },
            typeParameters = { enable = true },
        },
    }

    return metals_config
end

function M.config(_, metals_config)
    local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
    vim.api.nvim_create_autocmd("FileType", {
        pattern = { "scala", "sbt" },
        callback = function()
            require("metals").initialize_or_attach(metals_config)
        end,
        group = nvim_metals_group,
    })
end

return M
