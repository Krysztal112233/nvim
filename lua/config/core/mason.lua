local M = {}



function M.opts()
end

function M.config()
    require("mason").setup({
        registries = {
            "github:nvim-java/mason-registry",
            "github:mason-org/mason-registry",
            "github:Krysztal112233/mason-registry",
        }
    })
end

return M
