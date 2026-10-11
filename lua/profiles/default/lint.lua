return {

  { -- Linting
    'mfussenegger/nvim-lint',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      local lint = require 'lint'
      lint.linters_by_ft = {
         clojure = { "clj-kondo" },
         dockerfile = { "hadolint" },
         inko = { "inko" },
         janet = { "janet" },
         json = { "jsonlint" },
         markdown = { "vale" },
         rst = { "vale" },
         ruby = { "ruby" },
         terraform = { "tflint" },
         text = { "vale" }
      }

      local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
      vim.api.nvim_create_autocmd({  'BufWritePost', 'InsertLeave' }, {
        group = lint_augroup,
        callback = function()
          -- Only run the linter in buffers that you can modify in order to
          -- avoid superfluous noise, notably within the handy LSP pop-ups that
          -- describe the hovered symbol using Markdown.
          if vim.bo.modifiable then
            lint.try_lint()
          end
        end,
      })
    end,
  },
}
