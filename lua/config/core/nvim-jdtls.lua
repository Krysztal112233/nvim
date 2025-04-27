local M = {}

function M.opts()
    local mason = require("mason-registry")
    local lombok_path = vim.fs.joinpath(mason.get_package("lombok-edge"):get_install_path(), "lombok.jar")

    return {
        cmd = {
            "jdtls",
            ("--jvm-arg=-javaagent:%s"):format(lombok_path),
        },

        root_dir = vim.fs.root(0, { ".git", "mvnw", "gradlew" }),

        settings = {
            java = {
                format = { enable = true },
                inlayHints = { parameterNames = { enabled = 'all' } },
                maven = { downloadSources = true },
                references = { includeDecompiledSources = true },
                referencesCodeLens = { enable = true },
            }
        },
    }
end

return M
