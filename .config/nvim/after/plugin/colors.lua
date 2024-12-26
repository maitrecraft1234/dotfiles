
if os.getenv("TERM") ~= "linux" then
    vim.cmd.colorscheme "catppuccin-latte"
else
    vim.cmd.colorscheme "catppuccin-mocha"
end

