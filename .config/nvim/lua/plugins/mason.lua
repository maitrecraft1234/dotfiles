return {
  {
    "williamboman/mason.nvim",
    config = true
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
    config = function()
      require("mason-lspconfig").setup({ ensure_installed = { "lua_ls", "pyright", "rust_analyzer" } })
      local lspconfig = require("lspconfig")
    end,
  },

  {
    "saghen/blink.cmp",
    version = "*",
    dependencies = { "rafamadriz/friendly-snippets", "saghen/blink.compat" },
    lazy = true,
    event = "InsertEnter",
    opts = {
      completion = {
        documentation = { auto_show = true, auto_show_delay_ms = 200 },
        ghost_text = { enabled = true },
        accept = { auto_brackets = { enabled = true } }
      },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" }
      },
      keymap = { preset = "enter" },
    },
    config = function(_, opts)
      require("blink.cmp").setup(opts)
    end,
  },
}
