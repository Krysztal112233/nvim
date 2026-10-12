-- The shared editor settings run first; keep pager-specific overrides here.
vim.opt.number = false
vim.opt.relativenumber = false
vim.opt.signcolumn = 'no'
vim.opt.list = false
vim.opt.cursorline = false
vim.opt.wrap = false

-- No permanent footer; command/search input temporarily uses the last row.
vim.opt.showmode = false
vim.opt.showcmd = false
vim.opt.ruler = false
vim.opt.laststatus = 0
vim.opt.cmdheight = 0

-- Viewer sessions should not persist their contents in undo or ShaDa files.
vim.opt.undofile = false
vim.opt.swapfile = false
vim.opt.shadafile = 'NONE'

-- Restore the native keys overridden by editor.lua. Imports can be reloaded,
-- so deleting an already-removed mapping must remain harmless.
for mode, keys in pairs {
  n = { '<Esc>', '<C-h>', '<C-j>', '<C-k>', '<C-l>', 'H', 'L', '<leader>td' },
  v = { 'H', 'L', '<leader>td' },
  i = { 'jk' },
  t = { '<Esc><Esc>' },
} do
  for _, lhs in ipairs(keys) do
    pcall(vim.keymap.del, mode, lhs)
  end
end

-- The one pager-specific key; the WezTerm helper also sets it buffer-locally.
vim.keymap.set('n', 'q', '<cmd>quit<cr>', { silent = true, desc = 'Close viewer' })

-- editor.lua toggles line numbers on InsertEnter/InsertLeave. Run after that
-- hook rather than deleting shared or unrelated autocommands.
vim.api.nvim_create_autocmd({ 'BufWinEnter', 'InsertEnter', 'InsertLeave' }, {
  group = vim.api.nvim_create_augroup('viewer-pager', { clear = true }),
  callback = function()
    vim.wo.number = false
    vim.wo.relativenumber = false
  end,
})

-- Retain the shared Catppuccin theme and native clipboard/yank support.
-- cond=false skips loading without making these shared plugins clean targets.
return {
  { 'folke/which-key.nvim', cond = false },
  { 'folke/todo-comments.nvim', cond = false },
  { 'nvim-lua/plenary.nvim', cond = false },
  { 'echasnovski/mini.nvim', cond = false },
  { 'nvim-treesitter/nvim-treesitter', cond = false },
  { 'windwp/nvim-autopairs', cond = false },
  { 'numToStr/Comment.nvim', cond = false },
  { dir = vim.fn.stdpath 'config' .. '/local/selective-fold.nvim', cond = false },
  { 'glacambre/firenvim', cond = false },
}
