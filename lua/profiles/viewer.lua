-- The shared editor settings run first; keep pager-specific overrides here.
vim.opt.number = false
vim.opt.relativenumber = false
vim.opt.signcolumn = 'no'
vim.opt.list = false
vim.opt.cursorline = true
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

-- Persistent top-right badge so a pager session is never mistaken for an
-- editing session. Shows the cursor position as `VIEWER: <line>/<total>`.
-- Editor-relative floats do not disturb the layout.
local badge = { buf = nil, win = nil, text = nil }
local badge_group = vim.api.nvim_create_augroup('viewer-mode-badge', { clear = true })

local function apply_hls()
  vim.api.nvim_set_hl(0, 'ViewerModeBadge', { link = 'CurSearch' })
end

local function badge_render()
  if not (badge.buf and vim.api.nvim_buf_is_valid(badge.buf)) then
    return
  end
  local text = string.format(' VIEWER: %d/%d ', vim.api.nvim_win_get_cursor(0)[1], vim.api.nvim_buf_line_count(0))
  if text == badge.text then
    return
  end
  badge.text = text
  -- `-M` (WezTerm read-only viewing) resets the global 'modifiable' default,
  -- so even fresh scratch buffers start nomodifiable.
  vim.bo[badge.buf].modifiable = true
  vim.api.nvim_buf_set_lines(badge.buf, 0, -1, false, { text })
  vim.bo[badge.buf].modifiable = false
  if badge.win and vim.api.nvim_win_is_valid(badge.win) then
    -- NE anchor + col=screen width keeps the right edge pinned while the
    -- window grows leftward as the counter text widens.
    local cfg = vim.api.nvim_win_get_config(badge.win)
    cfg.width = vim.fn.strdisplaywidth(text)
    cfg.col = vim.o.columns
    vim.api.nvim_win_set_config(badge.win, cfg)
  end
end

local function badge_open()
  if badge.win and vim.api.nvim_win_is_valid(badge.win) then
    return
  end
  if not (badge.buf and vim.api.nvim_buf_is_valid(badge.buf)) then
    badge.buf = vim.api.nvim_create_buf(false, true)
  end
  badge_render()
  badge.win = vim.api.nvim_open_win(badge.buf, false, {
    relative = 'editor',
    anchor = 'NE',
    row = 0,
    col = vim.o.columns,
    width = vim.fn.strdisplaywidth(badge.text),
    height = 1,
    border = 'rounded',
    style = 'minimal',
    focusable = false,
    noautocmd = true,
  })
  vim.wo[badge.win].winhl = 'Normal:ViewerModeBadge,FloatBorder:ViewerModeBadge'
end

-- Lazy imports this module before VimEnter; act once the UI is up. The
-- schedule also runs after catppuccin's own VimEnter hook, which loads the
-- colorscheme from a non-nested autocmd and therefore never fires ColorScheme.
vim.api.nvim_create_autocmd('VimEnter', {
  group = badge_group,
  callback = function()
    vim.schedule(function()
      apply_hls()
      badge_open()
    end)
  end,
})

-- Keep the counter current as the cursor moves or the viewed buffer changes.
vim.api.nvim_create_autocmd({ 'CursorMoved', 'BufEnter', 'WinEnter' }, {
  group = badge_group,
  callback = badge_render,
})

-- Keep hugging the right edge when the terminal is resized.
vim.api.nvim_create_autocmd('VimResized', {
  group = badge_group,
  callback = function()
    if badge.win and vim.api.nvim_win_is_valid(badge.win) then
      local cfg = vim.api.nvim_win_get_config(badge.win)
      cfg.col = vim.o.columns
      vim.api.nvim_win_set_config(badge.win, cfg)
    end
  end,
})

-- `:highlight clear` during a colorscheme load drops our overrides, so
-- re-apply on every colorscheme change. This only covers runtime switches
-- (like the <leader>tc toggle); the startup load never fires this event,
-- see the VimEnter hook above.
vim.api.nvim_create_autocmd('ColorScheme', {
  group = badge_group,
  callback = apply_hls,
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
