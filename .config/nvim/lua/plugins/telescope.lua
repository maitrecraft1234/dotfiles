return {
  'nvim-telescope/telescope.nvim',
  version = '0.1.5',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons'
  },
  cmd = "Telescope",
  keys = {
      { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find files" },
      { "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Live grep" },
      { "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Buffers" },
      { "<C-p>", "<cmd>Telescope git_files<CR>", desc = "Git files" },

  },
  config = function()
      local actions = require('telescope.actions')
      local action_layout = require('telescope.actions.layout')

      require("telescope").setup({
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
              layout_config = { prompt_position = "top" },
              sorting_strategy = "ascending",
          },
      })
  end,
}
