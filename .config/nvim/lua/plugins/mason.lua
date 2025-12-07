return {
  {
    "williamboman/mason.nvim",
    config = true
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
    config = function()
            require("mason").setup()
            require("mason-lspconfig").setup({ ensure_installed = { "lua_ls", "pyright", "rust_analyzer" } })
            local lspconfig = require("lspconfig")
    end,
  },

}
