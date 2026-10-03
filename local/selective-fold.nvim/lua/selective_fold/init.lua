local M = {}
local rules = {}
-- bufnr -> { tick, levels }; levels are indexed by 1-based line number.
local cache = {}

local function fold_levels(buf)
  local ranges = rules[buf].ranges(buf)
  if not ranges then
    return nil
  end
  local levels = {}
  for _, range in ipairs(ranges) do
    levels[range[1]] = '>1'
    for line = range[1] + 1, range[2] do
      levels[line] = '1'
    end
  end
  return levels
end

function M.clear(buf)
  cache[buf] = nil
end

-- Filetypes are buffer-local, but fold options belong to each window.
function M.undo(buf)
  M.clear(buf)
  rules[buf] = nil
  for _, win in ipairs(vim.fn.win_findbuf(buf)) do
    vim.api.nvim_win_call(win, function()
      vim.cmd 'setlocal foldmethod< foldexpr< foldtext< foldenable< foldlevel<'
    end)
  end
end

-- Plain text: do not inherit conceal/extmark decorations from the first line.
function M.foldtext()
  local first = vim.fn.getline(vim.v.foldstart)
  local rule = rules[vim.api.nvim_get_current_buf()]
  local title = rule and rule.title(first) or vim.trim(first)
  local n = vim.v.foldend - vim.v.foldstart + 1
  return ('▸ %s ⋯ %d lines'):format(title, n)
end

-- As a v:lua foldexpr, Vim passes no argument; read v:lnum.
function M.expr(lnum)
  local buf = vim.api.nvim_get_current_buf()
  if not rules[buf] then
    return '0'
  end
  local tick = vim.api.nvim_buf_get_changedtick(buf)
  local entry = cache[buf]
  if not entry or entry.tick ~= tick then
    local ok, levels = pcall(fold_levels, buf)
    if not ok or not levels then
      -- Do not cache failures: a parser may become available without a text edit.
      return '0'
    end
    entry = { tick = tick, levels = levels }
    cache[buf] = entry
  end
  return entry.levels[lnum or vim.v.lnum] or '0'
end

-- Called by a language ftplugin; rules provide ranges, a title and a command name.
function M.attach(rule)
  local buf = vim.api.nvim_get_current_buf()
  rules[buf] = rule
  M.clear(buf)
  local group = vim.api.nvim_create_augroup('SelectiveFold_' .. buf, { clear = true })

  -- Set the expression before enabling expr folding, which can evaluate it immediately.
  vim.opt_local.foldexpr = "v:lua.require'selective_fold'.expr()"
  vim.opt_local.foldtext = "v:lua.require'selective_fold'.foldtext()"
  vim.opt_local.foldlevel = 0
  vim.opt_local.foldenable = true
  vim.opt_local.foldmethod = 'expr'

  local actions = { on = 'foldenable', off = 'nofoldenable', toggle = 'invfoldenable' }
  vim.api.nvim_buf_create_user_command(buf, rule.command, function(opts)
    local option = actions[opts.args ~= '' and opts.args or 'toggle']
    if not option then
      return vim.notify('Usage: ' .. rule.command .. ' [on|off|toggle]', vim.log.levels.ERROR)
    end

    vim.cmd.setlocal(option)
  end, {
    nargs = '?',
    desc = 'Enable, disable or toggle selective folds in this window',
    complete = function(lead)
      return vim.tbl_filter(function(action)
        return vim.startswith(action, lead)
      end, { 'on', 'off', 'toggle' })
    end,
  })

  vim.api.nvim_create_autocmd('BufWipeout', {
    group = group,
    buffer = buf,
    once = true,
    callback = function()
      M.clear(buf)
      rules[buf] = nil
      vim.api.nvim_del_augroup_by_id(group)
    end,
  })

  local undo = ("call v:lua.require'selective_fold'.undo(%d)" .. ' | silent! delcommand -buffer %s' .. ' | silent! call nvim_del_augroup_by_id(%d)'):format(
    buf,
    rule.command,
    group
  )
  vim.b.undo_ftplugin = (vim.b.undo_ftplugin and vim.b.undo_ftplugin .. '\n' or '') .. undo
end

return M
