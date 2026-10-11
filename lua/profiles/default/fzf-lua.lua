return {
  'ibhagwan/fzf-lua',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  ---@module "fzf-lua"
  ---@type fzf-lua.Config|{}
  ---@diagnostic disable: missing-fields
  opts = {
    keymap = {},
  },
  config = function()
    require('fzf-lua').setup {
      'telescope',
      -- Collapse parent dirs to 1 char in LSP pickers (references, definitions,
      -- implementations, ...) so long relative paths such as
      -- src/main/scala/dev/krysztal/.../Foo.scala stay readable. Actions still
      -- resolve the full path (fzf-lua lengthens entries back on <CR>).
      lsp = { path_shorten = true },
    }

    local fzf = require 'fzf-lua'

    vim.keymap.set('n', '<leader><leader>', fzf.buffers, { desc = '[ ] Find existing buffers' })
    vim.keymap.set('n', '<leader>s.', fzf.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
    vim.keymap.set('n', '<leader>sd', fzf.lsp_workspace_diagnostics, { desc = '[S]earch [D]iagnostics' })
    vim.keymap.set('n', '<leader>sf', fzf.files, { desc = '[S]earch [F]iles' })
    vim.keymap.set('n', '<leader>sg', fzf.live_grep, { desc = '[S]earch by [G]rep' })
    vim.keymap.set('n', '<leader>sh', fzf.help_tags, { desc = '[S]earch [H]elp' })
    vim.keymap.set('n', '<leader>sk', fzf.keymaps, { desc = '[S]earch [K]eymaps' })
    vim.keymap.set('n', '<leader>sld', fzf.lsp_document_symbols, { desc = '[S]earch [L]sp [D]ocument symbols' })
    vim.keymap.set('n', '<leader>slw', fzf.lsp_document_symbols, { desc = '[S]earch [L]sp [W]orkspace symbols' })
    vim.keymap.set('n', '<leader>sr', fzf.resume, { desc = '[S]earch [R]esume' })
    vim.keymap.set('n', '<leader>ss', fzf.builtin, { desc = '[S]earch [S]elect fzf-lua' })
    vim.keymap.set('n', '<leader>sw', fzf.grep_cword, { desc = '[S]earch current [W]ord' })

    vim.keymap.set('n', '<leader>/', fzf.lgrep_curbuf, { desc = '[/] Fuzzily search in current buffer' })

    vim.keymap.set('n', '<leader>sn', function()
      fzf.files { cwd = vim.fn.stdpath 'config' }
    end, { desc = '[S]earch [N]eovim files' })

    -- Per-buffer LSP mappings (moved from editor.lua, which is now plugin-free).
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('fzf-lsp-attach', { clear = true }),
      callback = function(event)
        local map = function(keys, func, desc, mode)
          mode = mode or 'n'
          vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end

        -- Execute a code action, usually your cursor needs to be on top of an error
        -- or a suggestion from your LSP for this to activate.
        map('gra', fzf.lsp_code_actions, '[G]oto Code [A]ction', { 'n', 'x' })

        -- Find references for the word under your cursor.
        map('grr', fzf.lsp_references, '[G]oto [R]eferences')

        -- Jump to the implementation of the word under your cursor.
        --  Useful when your language has ways of declaring types without an actual implementation.
        map('gri', fzf.lsp_implementations, '[G]oto [I]mplementation')

        -- Jump to the definition of the word under your cursor.
        --  To jump back, press <C-t>.
        map('grd', fzf.lsp_definitions, '[G]oto [D]efinition')

        -- Fuzzy find all the symbols in your current document.
        map('gO', fzf.lsp_document_symbols, 'Open Document Symbols')

        -- Fuzzy find all the symbols in your current workspace.
        --  Similar to document symbols, except searches over your entire project.
        map('gW', fzf.lsp_live_workspace_symbols, 'Open Workspace Symbols')

        -- Jump to the type of the word under your cursor.
        map('grt', fzf.lsp_typedefs, '[G]oto [T]ype Definition')
      end,
    })

    vim.cmd 'FzfLua register_ui_select'
  end,
}
