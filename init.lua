-- The starting of the Neovim's world

-- Ensure requirements
local requirement = require("requirement")
requirement.ensure()

-- Apply keymaps
require("config.keymaps")

-- Apply plugin management
require("config.lazy")

-- Apply options
require("config.options")

-- Apply editor settings
require("config.editor")

-- Apply lsp configurations
require("config.lsp")

-- Apply spell check configuration
require("config.lang")
