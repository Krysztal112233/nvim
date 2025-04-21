local M = {}

function M.config()
    require("java").setup({})
end

function M.opts()
    return {
        servers = {
            jdtls = {
                handlers = {
                    ["$/progress"] = function(_, _, _) end,
                },
            },
        },

        setup = {
            jdtls = function()
                require("java").setup({
                    spring_boot_tools = {
                        enable = false,
                    },
                    java_debug_adapter = {
                        enable = false,
                    },
                    java_test = {
                        enable = false,
                    },
                    notifications = {
                        dap = false,
                    },
                    root_markers = {
                        "settings.gradle",
                        "settings.gradle.kts",
                        "pom.xml",
                        "build.gradle",
                        "mvnw",
                        "gradlew",
                        "build.gradle",
                        "build.gradle.kts",
                    },
                })
            end,
        },
    }
end

return M
