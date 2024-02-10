require("dapui").setup()
local dap = require("dap")
local dapui = require("dapui")

dap.adapters.gdb = {
  type = "executable",
  command = "gdb",
  args = { "-i", "dap" }
}
dap.configurations.c = {
  {
    name = "Launch",
    type = "gdb",
    request = "launch",
    program = vim.fn.getcwd() .. "/debug",
    cwd = "${workspaceFolder}",
  },
}

local cmp_nvim_lsp = require "cmp_nvim_lsp"

require("lspconfig").clangd.setup {
  on_attach = on_attach,
  capabilities = cmp_nvim_lsp.default_capabilities(),
  cmd = {
    "clangd",
    "--offset-encoding=utf-16",
  },
}

vim.api.nvim_set_keymap('n', '<leader>dt', '<Cmd>lua require("dapui").toggle()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>de', '<Cmd>lua require("dapui").eval()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>db', ":DapToggleBreakpoint<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>dc', ":DapContinue<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>dr', "<Cmd>lua vim.cmd(':!make debug')<CR><Cmd>lua vim.cmd(':DapContinue')<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ds', ":DapStepInto<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>dn', ":DapStepOver<CR>", { noremap = true, silent = true })

