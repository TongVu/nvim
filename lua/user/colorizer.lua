-- Attaches to every FileType mode
-- require 'colorizer'.setup()
-- Attach to certain Filetypes, add special configuration for `html`
-- Use `background` for everything else.
local status_ok, nvim_colorizer = pcall(require, "colorizer")
if not status_ok then
    return
end

-- nvim_colorizer.setup {
--     'css';
--     'javascript';
--     html = {
--         mode = 'foreground';
--     }
-- }

-- Use the `default_options` as the second parameter, which uses
-- `foreground` for every mode. This is the inverse of the previous
-- setup configuration.
-- require 'colorizer'.setup({
--     'css';
--     'javascript';
--     html = { mode = 'background' };
-- }, { mode = 'foreground' })

-- Use the `default_options` as the second parameter, which uses
-- `foreground` for every mode. This is the inverse of the previous
-- setup configuration.
-- require 'colorizer'.setup {
--     '*'; -- Highlight all files, bu customize some others.
--     css = { rgb_fn = true; }; -- Enable parsing rgb(...) functions in css.
--     html = { names = false; } -- Disable parsing "names" like Blue or Gray
-- }

-- Exclude some filetypes from highlighting by using `!`
nvim_colorizer.setup {
    '*'; -- Highlight all files, but customize some others.
    -- '!vim'; -- Exclude vim from highlighting.
    -- Exclusion Only makes sense if '*' is specified!

    css = { rgb_fn = true; }; -- Enable parsing rgb(...) functions in css.
    html = { names = false; } -- Disable parsing "names" like Blue or Gray
}
-- colorizer.setup() -- add this line for always attach to buffer
