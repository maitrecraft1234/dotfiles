return {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    config = function()
        ---@diagnostic disable: undefined-global

        local uv = vim.loop

        local theme_file = vim.fn.expand("/tmp/.theme")
        local handle = uv.new_fs_event()

        local function apply_theme()
            local file = io.open(theme_file, "r")
            if not file then
                vim.notify("Could not read .theme", vim.log.levels.WARNING)
                return
            end

            local content = file:read("*all")
            file:close()

            content = content:lower()
            if content:find("dark") then
                vim.cmd.colorscheme("catppuccin-mocha")
            elseif content:find("light") then
                vim.cmd.colorscheme("catppuccin-latte")
            else
                vim.cmd.colorscheme("catppuccin-latte") -- maybe some other default idk
            end
        end

        uv.fs_event_start(handle, theme_file, {}, function(err, _, _)
            if err then
                vim.schedule(function()
                    vim.notify("Error watching .theme: " .. err, vim.log.levels.ERROR)
                end)
            else
                vim.schedule(apply_theme)
            end
        end)

        apply_theme()
    end,
}
