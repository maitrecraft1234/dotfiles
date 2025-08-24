return {
  name = "floaterm",
  dir = vim.fn.stdpath("config") .. "/lua/floaterm",
  keys = {
      {'<leader>t', '<cmd>Floaterminal<CR>i'},
      {'<C-v>', '<cmd>Floaterminal<CR>', mode = 't'},
  },
  config = function()
    require("floaterm")
  end,
}
