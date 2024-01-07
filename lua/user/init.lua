return {
  lsp = {
    servers = {},
    formatting = {
      timeout_ms = 15000,
      format_on_save = true, -- enable or disable automatic formatting on save
    },
  },
  mappings = {
    n = {
      ["<leader>L"] = { ":EslintFixAll<cr>", desc = "ESLint Fix All" },
      ["<leader>R"] = { ":LspRestart<cr>", desc = "Reload LSP" },
      ["<leader>W"] = { ":noa w<cr>", desc = "Save w/o Formatting" },
      ["<leader>ff"] = {
        "<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>",
        desc = "Find Files",
      },
    },
  },
  plugins = {
    { "bluz71/vim-nightfly-colors", name = "nightfly", lazy = false, priority = 1000 },
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
          "tsserver",
          "prismals",
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
            "eslint",
          },
        }
      end,
    },
  },
}
