local M = { command = 'MarkdownFold' }
local query

function M.ranges(buf)
  local parser = vim.treesitter.get_parser(buf, 'markdown')
  query = query or vim.treesitter.query.get('markdown', 'selective_folds')
  if not parser or not query then
    return nil
  end
  -- Host Markdown only: parsing injections would also fold unmarked code.
  local trees = parser:parse()
  if not trees then
    return nil
  end
  local ranges = {}
  for _, tree in ipairs(trees) do
    for id, node in query:iter_captures(tree:root(), buf) do
      if query.captures[id] == 'fold' then
        local srow, _, erow, ecol = node:range()
        -- TS rows are 0-based/exclusive; rules return 1-based/inclusive lines.
        ranges[#ranges + 1] = { srow + 1, ecol == 0 and erow or erow + 1 }
      end
    end
  end
  return ranges
end

function M.title(first)
  local info = first:match '^%s*```+%s*(.-)%s*$' or first:match '^%s*~~~+%s*(.-)%s*$'
  return info and info ~= '' and info or vim.trim(first)
end

return M
