local bufnr = vim.api.nvim_get_current_buf()

vim.keymap.set('n', 'K', function()
  -- rustaceanvim only ships with the default profile; degrade to plain hover.
  if not pcall(vim.cmd.RustLsp, { 'hover', 'actions' }) then
    vim.lsp.buf.hover()
  end
end, { silent = true, buffer = bufnr })
