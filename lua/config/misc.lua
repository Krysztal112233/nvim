local line_number_auto_switch = true -- Enable auto-switch for line numbers

-- Auto-switch line number mode based on insert mode
local function setup_line_number_switching()
    if not line_number_auto_switch then return end

    vim.api.nvim_create_autocmd({ "InsertEnter", "InsertLeave" }, {
        callback = function(args)
            if args.event == "InsertEnter" then
                vim.o.number = true
                vim.o.relativenumber = false -- Insert mode: absolute line numbers only
            else
                vim.o.number = true
                vim.o.relativenumber = true -- Normal mode: absolute + relative line numbers
            end
        end,
    })

    -- Ensure correct line number mode on startup
    vim.o.number = true
    vim.o.relativenumber = true
end

-- Initialize configurations
vim.o.number = true

setup_line_number_switching()
