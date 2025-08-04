local copilot_chat = require("CopilotChat")

vim.keymap.set("n", "<leader>l", ":Copilot disable<CR>")
vim.keymap.set("n", "<leader>m", ":Copilot enable<CR>")

vim.g.copilot_enabled = false

require('render-markdown').setup({
  file_types = { 'markdown', 'copilot-chat' },
})

vim.keymap.set('n', '<leader>ccq', function()
  local input = vim.fn.input("Quick Chat: ")
  if input ~= "" then
    copilot_chat.ask(input, {
      selection = require("CopilotChat.select").buffer
 })
  end
end, { desc = "CopilotChat - Quick chat" })

vim.keymap.set('n', '<leader>cct', function()
  copilot_chat.toggle()
end, { desc = "CopilotChat - Toggle CopilotChat" })

copilot_chat.setup {
    highlight_headers = false,
    separator = '---',
    error_header = '> [!ERROR] Error',

    -- window = {
    --     layout = 'float',
    --     relative = 'cursor',
    --     width = 1,
    --     height = 0.5,
    --     row = 1
    -- }
}
