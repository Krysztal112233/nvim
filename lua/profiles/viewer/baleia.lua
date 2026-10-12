-- Shared spec location (installed in every profile, so `:Lazy clean` under
-- default never removes it), but only loads inside the viewer profile, which
-- uses it to render the ANSI colors in WezTerm scrollback exports.
return { 'm00qek/baleia.nvim', version = '*' }
