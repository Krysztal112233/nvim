return {
  'scalameta/nvim-metals',
  dependencies = { 'mfussenegger/nvim-dap' },
  ft = { 'scala', 'gradle' },
  opts = function()
    local lsp = require 'core.lsp'
    -- Initialized basic nvim-metals configuration
    local metals_config = require('metals').bare_config()
    metals_config.init_options.statusBarProvider = 'off'
    metals_config.capabilities = lsp.capabilities()

    -- On attach function
    metals_config.on_attach = function(_, _)
      require('metals').setup_dap()
    end

    -- Replace the default cmdline list/input with picker-based UIs.
    -- Server->client request handlers must return the response synchronously,
    -- but Neovim runs them inside a coroutine (vim/lsp/rpc.lua), so we can
    -- yield until the async vim.ui.select / vim.ui.input callback resumes us.
    metals_config.handlers = {
      -- fzf-lua picker (via `FzfLua register_ui_select`) instead of inputlist()
      ['metals/quickPick'] = function(_, result)
        local co = coroutine.running()
        if not co then -- fallback when not running in a coroutine
          return require('metals.handlers')['metals/quickPick'](_, result)
        end

        vim.ui.select(result.items, {
          prompt = result.placeHolder or 'Metals: select kind',
          format_item = function(item)
            return item.detail and (item.label .. ' — ' .. item.detail) or item.label
          end,
        }, function(choice)
          -- Defer the resume: vim.ui callbacks may fire synchronously (before
          -- the yield below, e.g. the default vim.ui.input) or from a fast
          -- event context, both of which would break a direct resume here.
          vim.schedule(function()
            local ok, err = coroutine.resume(co, choice and choice.id or nil)
            if not ok then
              vim.notify('metals/quickPick handler: ' .. tostring(err), vim.log.levels.ERROR)
            end
          end)
        end)

        local item_id = coroutine.yield()
        return item_id and { itemId = item_id } or { cancelled = true }
      end,

      -- vim.ui.input instead of fn.input()
      ['metals/inputBox'] = function(_, result)
        local co = coroutine.running()
        if not co then
          return require('metals.handlers')['metals/inputBox'](_, result)
        end

        vim.ui.input({ prompt = result.prompt .. ' ', default = result.value }, function(value)
          vim.schedule(function()
            local ok, err = coroutine.resume(co, value)
            if not ok then
              vim.notify('metals/inputBox handler: ' .. tostring(err), vim.log.levels.ERROR)
            end
          end)
        end)

        local value = coroutine.yield()
        return (value and value ~= '') and { value = value } or { cancelled = true }
      end,
    }

    metals_config.settings = {
      inlayHints = {
        hintsInPatternMatch = { enable = true },
        implicitArguments = { enable = true },
        implicitConversions = { enable = true },
        inferredTypes = { enable = true },
        typeParameters = { enable = true },
      },
    }

    return metals_config
  end,

  config = function(_, config)
    local nvim_metals_group = vim.api.nvim_create_augroup('nvim-metals', { clear = true })
    vim.api.nvim_create_autocmd('FileType', {
      pattern = { 'scala', 'sbt' },
      callback = function()
        require('metals').initialize_or_attach(config)
      end,
      group = nvim_metals_group,
    })
  end,
}
