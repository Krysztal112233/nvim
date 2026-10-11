return {
  'mrcjkb/rustaceanvim',
  version = '^6',
  ft = { 'rust' },
  init = function()
    vim.g.rustaceanvim = function()
      return {
        server = {
          capabilities = require('core.lsp').capabilities {
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
        },
      }
    end
  end,
}
