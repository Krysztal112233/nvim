return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    {
      'mason-org/mason.nvim',
      opts = {
        registries = {
          'github:mason-org/mason-registry',
          'github:Krysztal112233/mason-registry',
        },
      },
    },
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    { 'j-hui/fidget.nvim', opts = {} },
    'saghen/blink.cmp',
  },
  config = function()
    local lsp = require 'core.lsp'

    require('mason-tool-installer').setup {
      ensure_installed = lsp.ensure_installed(),
    }

    lsp.setup()
  end,
}
