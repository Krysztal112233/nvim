local cfg = {
    init_options = {
        updateOnSave = true,
        updateOnSaveWaitMillis = 1000,
    },
}

vim.lsp.config("bacon-ls", cfg)
