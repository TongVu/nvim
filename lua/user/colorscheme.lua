local cmd = vim.cmd
local colorscheme = "gruvbox"
cmd[[ let gruvbox_invert_tabline=1 ]] -- I love this inver_selection so much!!!
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
    vim.notify("colorscheme " .. colorscheme .. " not found!")
    return
end
vim.cmd[[:hi Cursor gui=reverse guibg=NONE guifg=NONE ]]
vim.cmd[[:hi CursorLine gui=reverse ]]
