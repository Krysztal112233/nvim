-- Fold only markdown code blocks marked with `fold`; see lua/md_fold.lua.
vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "v:lua.require'md_fold'.expr()"
vim.wo.foldtext = "v:lua.require'md_fold'.foldtext()"
vim.wo.foldenable = true
vim.wo.foldlevel = 0

-- Parse before the first foldexpr evaluation (first redraw).
pcall(function()
  vim.treesitter.get_parser(0, "markdown"):parse(true)
end)

-- Re-set foldmethod once startup settles to force a full recompute of Vim's
-- C-side fold cache, which otherwise can stay stale with large files and
-- obsidian/LSP activity; no public API does this.
vim.api.nvim_create_autocmd("SafeState", {
  once = true,
  callback = function()
    if vim.wo.foldmethod == "expr" then
      vim.wo.foldmethod = "expr"
    end
  end,
})
