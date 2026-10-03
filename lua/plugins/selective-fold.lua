return {
  dir = vim.fn.stdpath 'config' .. '/local/selective-fold.nvim',
  lazy = false,
  config = function(plugin)
    -- Keep our highlight query ahead of site/queries.
    vim.opt.runtimepath:prepend(plugin.dir)
  end,
}
