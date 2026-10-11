-- Shared spec location (installed in every profile, so `:Lazy clean` under
-- default never removes the browser bridge), but only loads inside Firenvim.
-- Firenvim sets g:started_by_firenvim before the config loads.
return { 'glacambre/firenvim', build = ':call firenvim#install(0)', cond = not not vim.g.started_by_firenvim }
