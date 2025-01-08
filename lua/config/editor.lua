-- Configuration for colorschemes
local colors_day = "tokyonight-day"    -- Light colorscheme
local colors_night = "tokyonight-moon" -- Dark colorscheme

-- Tab settings
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

-- Enable `.editorconfig`
vim.g.editorconfig = true

-- Apply colorscheme based on the time of day
local function apply_colorscheme()
    vim.o.termguicolors = true
    local hour = tonumber(os.date("%H"))
    local scheme = (hour >= 19 or hour < 9) and function()
        -- Set darker theme
        vim.cmd.colorscheme(colors_night)
    end or function()
        -- Set lighter theme
        vim.cmd.colorscheme(colors_day)
    end

    scheme()

    -- Paired bracket
    vim.cmd('highlight MatchParen guibg=Blue guifg=White gui=bold')
end


apply_colorscheme()
