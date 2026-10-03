local tests = vim.fs.dirname(debug.getinfo(1, 'S').source:sub(2))
vim.opt.runtimepath:prepend(vim.fs.dirname(tests))

local buf = vim.fn.bufadd(tests .. '/markdown.md')
vim.fn.bufload(buf)

-- Inclusive line ranges in markdown.md; everything else must stay unfolded.
local expected = {
  { 7, 9 }, -- Backticks
  { 13, 15 }, -- Case-insensitive marker
  { 19, 21 }, -- Angle-bracket marker
  { 25, 27 }, -- Tilde fence
  { 31, 33 }, -- Longer fence
  { 37, 38 }, -- Empty block
  { 42, 44 }, -- Block quote
  { 50, 52 }, -- List item
  { 56, 58 }, -- Adjacent: first block
  { 59, 61 }, -- Adjacent: second block
  { 77, 78 }, -- Unclosed fence
}

local actual = require('selective_fold.rules.markdown').ranges(buf)
assert(vim.deep_equal(actual, expected), 'Expected: ' .. vim.inspect(expected) .. '\nActual: ' .. vim.inspect(actual))
print(('PASS: %d fold ranges in markdown.md'):format(#expected))
