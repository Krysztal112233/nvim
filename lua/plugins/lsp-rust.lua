return {
  'mrcjkb/rustaceanvim',
  version = '^6',
  config = function()
    vim.lsp.config(
      'rust_analyzer',
      --- @type vim.lsp.ClientConfig
      {
        cmd = { 'rust-analyzer' },
        filetypes = { 'rust' },
        capabilities = {
          experimental = {
            commands = {
              commands = {
                'rust-analyzer.showReferences',
                'rust-analyzer.runSingle',
                'rust-analyzer.debugSingle',
              },
            },
          },
        },
        settings = {
          ['rust-analyzer'] = {
            check = true,
            checkOnSave = true,

            lens = {
              enable = true,
              run = { enable = true },
              implementations = { enable = true },
              references = {
                adt = { enable = true },
                method = { enable = true },
                trait = { enable = true },
                enumVariant = { enable = true },
              },
            },
          },
        },
      }
    )
  end,
}
