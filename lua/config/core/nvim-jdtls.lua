local M = {}

function M.opts()
    local lombok_path = vim.fs.joinpath(vim.fs.joinpath(vim.fn.stdpath("data"), "mason", "packages"), "lombok-edge",
        "lombok.jar")
    local java_test_path = vim.fs.joinpath(vim.fs.joinpath(vim.fn.stdpath("data"), "mason", "packages"), "java-test")
    local pkg_jar = vim.fn.glob(vim.fs.joinpath(java_test_path, "java-test", "extension", "server") ..
        "/*.jar");

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
        init_options = {
            bundles = pkg_jar,
        },
    }
end

return M
