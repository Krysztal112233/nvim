-- Fold only fenced code blocks whose info string has a `fold` marker
-- (e.g. ```bash fold, Docusaurus style).
--
-- Not vim.treesitter.foldexpr(): that one also walks injected language
-- trees, so sql/rust folds.scm would fold inside unmarked code blocks.
-- parser:trees() covers the host markdown tree only.

local query = vim.treesitter.query.parse("markdown", [[
  (fenced_code_block
    (info_string) @_info
    (#match? @_info "\<[fF][oO][lL][dD]\>")) @marked
]])

-- bufnr -> { tick, ranges }; ranges are 0-based inclusive {start_row, end_row}
local cache = setmetatable({}, { __mode = "k" })

local function marked_ranges(buf)
  local ok, parser = pcall(vim.treesitter.get_parser, buf, "markdown")
  if not ok or not parser then
    return {}
  end
  parser:parse(true)
  local ranges = {}
  for _, tree in ipairs(parser:trees()) do
    for id, node in query:iter_captures(tree:root(), buf) do
      if query.captures[id] == "marked" then
        local srow, _, erow, ecol = node:range()
        if ecol == 0 then
          erow = erow - 1 -- TS end is exclusive; fold back onto the closing fence
        end
        ranges[#ranges + 1] = { srow, erow }
      end
    end
  end
  return ranges
end

local M = {}

-- Plain virtual text drawn with the Folded group; never picks up
-- conceal/extmark decorations from the underlying line.
function M.foldtext()
  local first = vim.fn.getline(vim.v.foldstart)
  local info = first:match("^%s*```+%s*(.-)%s*$")
  if not info or info == "" then
    info = vim.trim(first)
  end
  local n = vim.v.foldend - vim.v.foldstart + 1
  return ("▸ %s ⋯ %d lines"):format(info, n)
end

-- Note: as a v:lua foldexpr, Vim passes no argument; read v:lnum.
function M.expr(lnum)
  lnum = lnum or vim.v.lnum
  local buf = vim.api.nvim_get_current_buf()
  local tick = vim.api.nvim_buf_get_changedtick(buf)
  local entry = cache[buf]
  if not entry or entry.tick ~= tick then
    entry = { tick = tick, ranges = marked_ranges(buf) }
    cache[buf] = entry
  end
  local row = lnum - 1
  for _, r in ipairs(entry.ranges) do
    if row == r[1] then
      return ">1"
    elseif row > r[1] and row <= r[2] then
      return "1"
    end
  end
  return "0"
end

return M
