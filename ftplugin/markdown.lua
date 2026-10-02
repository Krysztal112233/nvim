-- Markdown 折叠：
-- 1) 折叠范围交给 tree-sitter：Neovim 运行时自带的 queries/markdown/folds.scm
--    已把 fenced_code_block / section 等捕获为 @fold（与 textobj 同源的语义捕获）。
-- 2) 打开 buffer 时，自动折叠 info string 里带 `fold` 关键字的代码块
--    （例如 ```bash fold），其余代码块保持展开但仍可手动折叠。

vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.wo.foldenable = true
vim.wo.foldlevel = 99 -- 默认全部展开，下面只精确关闭带 fold 标记的块

-- 带谓词的 tree-sitter 查询：只匹配 info string 中含独立单词 fold 的块
local marked_query = vim.treesitter.query.parse("markdown", [[
  (fenced_code_block
    (info_string) @_info
    (#match? @_info "\\c.*\\<fold\\>.*")) @marked_block
]])

local function close_marked_blocks(buf, win)
  local ok, parser = pcall(vim.treesitter.get_parser, buf, "markdown")
  if not ok or not parser then
    return
  end
  parser:parse(true) -- 确保语法树已解析完成
  vim.api.nvim_win_call(win, function()
    for _, tree in ipairs(parser:trees()) do
      for id, node in marked_query:iter_captures(tree:root(), buf) do
        if marked_query.captures[id] == "marked_block" then
          local row = node:range()
          -- :foldclose 使用 1-based 行号（不加 !，避免连带关闭外层 section 折叠）
          pcall(vim.cmd, (row + 1) .. "foldclose")
        end
      end
    end
  end)
end

-- BufWinEnter 在每个展示该 buffer 的窗口里执行一次（ftplugin 只随 FileType 触发一次）
vim.api.nvim_create_autocmd("BufWinEnter", {
  buffer = vim.api.nvim_get_current_buf(),
  callback = function(ev)
    local win = vim.api.nvim_get_current_win()
    if vim.w[win].md_marked_folds_closed then
      return
    end
    vim.w[win].md_marked_folds_closed = true
    close_marked_blocks(ev.buf, win)
  end,
})
