-- The starting of the Neovim's world

-- Ensure requirements
local requirement = require("requirement")
requirement.ensure()

-- Apply mapping configurations
require("config.mapping")

-- Apply plugin management
require("config.lazy")

-- Apply misc configurations
require("config.misc")

-- Apply lsp configurations
require("config.lsp")

-- Apply spell check configuration
require("config.lang")
