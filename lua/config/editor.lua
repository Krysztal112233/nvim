-- Configuration for colorschemes
local colors_day = "monokai-pro-classic" -- Light colorscheme
local colors_night = "tokyonight-moon"   -- Dark colorscheme

-- Tab settings
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

-- Enable `.editorconfig`
vim.g.editorconfig = true

-- Apply colorscheme based on the time of day
local function apply_colorscheme()
    local hour = tonumber(os.date("%H"))
    local scheme = (hour >= 19 or hour < 11) and colors_night or colors_day
    vim.cmd("colorscheme " .. scheme)
end


apply_colorscheme()
