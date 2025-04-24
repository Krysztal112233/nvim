local M = {}

function M.opts()
    local jdtls_path = ""
    local lombok_path = ""


    return {
        cmd = {
            'java',

            '-Declipse.application=org.eclipse.jdt.ls.core.id1',
            '-Dosgi.bundles.defaultStartLevel=4',
            '-Declipse.product=org.eclipse.jdt.ls.core.product',
            '-Dlog.protocol=true',
            '-Dlog.level=ALL',
            '-Xmx8g',

            '--add-modules=ALL-SYSTEM',
            '--add-opens', 'java.base/java.util=ALL-UNNAMED',
            '--add-opens', 'java.base/java.lang=ALL-UNNAMED',

            '-jar', jdtls_path,
            'java-agent:', lombok_path,
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
