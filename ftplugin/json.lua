-- nvim-lspconfig only ships with the default profile.
if vim.lsp.config['jsonls'] then
  vim.lsp.enable 'jsonls'
end
