return {
  lsp = {
    servers = {},
    formatting = {
      format_on_save = true, -- enable or disable automatic formatting on save
    },
  },
  plugins = {
    {
      "mason-lspconfig.nvim",
      opts = {
        ensure_installed = {
          "angularls",
          "cssls",
          "html",
          "lua_ls",
          "tailwindcss",
          "volar",
          "vtsls",
        },
      },
    },
    {
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      lazy = false,
      config = function()
        require("mason-tool-installer").setup {
          ensure_installed = {
            "stylua",
            "eslint_d",
            "prettierd",
          },
        }
      end,
    },
  },
}
