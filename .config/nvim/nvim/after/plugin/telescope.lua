local builtin = require('telescope.builtin')
local actions = require('telescope.actions')
local action_layout = require("telescope.actions.layout")

require('telescope').setup{
    defaults = {
        mappings = {
            i = {
                ["<esc>"] = actions.close,
                ["<C-c>"] = { "<esc>", type = "command" },
                ["<C-a>"] = action_layout.toggle_preview,
                ["<C-j>"] = actions.select_default,
                ["<C-y>"] = actions.select_default,
            },
            n = {
                ["<C-c>"] = actions.close,
                ["<C-a>"] = action_layout.toggle_preview,
            },
        },
    },
}

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})

