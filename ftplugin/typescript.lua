local bufnr = vim.api.nvim_get_current_buf()
local first_line = vim.api.nvim_buf_get_lines(bufnr, 0, 1, false)[1]

if first_line and first_line:match('^#!/') and first_line:match('deno') then
  local config = vim.lsp.config['denols']
  if config then
    config = vim.deepcopy(config)
    config.root_dir = vim.fs.root(bufnr, { 'deno.json', 'deno.jsonc', 'deno.lock', '.git' })
      or vim.fn.getcwd()
    vim.lsp.start(config, { bufnr = bufnr })
  end
else
  local config = vim.lsp.config['ts_ls']
  if config then
    config = vim.deepcopy(config)
    config.root_dir = vim.fs.root(bufnr, {
      'package-lock.json',
      'yarn.lock',
      'pnpm-lock.yaml',
      'bun.lockb',
      'bun.lock',
      '.git',
    }) or vim.fn.getcwd()
    vim.lsp.start(config, { bufnr = bufnr })
  end
end
