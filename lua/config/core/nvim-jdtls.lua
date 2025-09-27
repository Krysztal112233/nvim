local M = {}

function M.opts()
    local mason = vim.fs.joinpath(vim.fn.stdpath("data"), "mason", "packages")

    local lombok_path = vim.fs.joinpath(mason, "lombok-edge", "lombok.jar")
    local java_test_path = vim.fs.joinpath(mason, "java-test")
    local pkg_jar = vim.fn.glob(vim.fs.joinpath(java_test_path, "java-test", "extension", "server") .. "/*.jar")
    -- vim.list_extend(
    --     pkg_jar,
    --     vim.fn.glob(vim.fs.joinpath(mason, "vscode-spring-boot-tools", "extension", "jars") .. "/*.jar")
    -- )

    local tmp_file = os.tmpname()
    local workspace =
        vim.fs.joinpath(vim.fn.fnamemodify(tmp_file, ":h"), "jdtls", vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t"))
    return {
        cmd = {
            "jdtls",
            ("--jvm-arg=-javaagent:%s"):format(lombok_path),
            ("--data:%s"):format(workspace),
        },

        root_dir = vim.fs.root(0, { ".git", "mvnw", "gradlew" }),

        settings = {
            java = {
                format = { enable = true },
                inlayHints = { parameterNames = { enabled = "all" } },
                maven = { downloadSources = true },
                references = { includeDecompiledSources = true },
                referencesCodeLens = { enable = true },
            },
        },
        init_options = {
            bundles = pkg_jar,
        },
    }
end

return M
