local module = {}

-- Managed by mason-lspconfig
module.mason_lspconfig = {
  ensure_installed = {
    "lua_ls",
    "bashls",
    "jsonls",
    "metals"
  },
  automatic_installation = true,
}

-- Scala metals managed by nvim-metals
module.scala_file_type = { "scala", "sbt", "java" }

-- Completion sources
module.cmp_sources = {
  { name = "nvim_lsp" },
  { name = "buffer" },
  { name = "path" },
}

return module
