return {
  lsp = {
    servers = {},
    formatting = {
      format_on_save = true, -- enable or disable automatic formatting on save
    },
  },
  mappings = {
    n = {
      ["<leader>L"] = { ":EslintFixAll<cr>", desc = "ESLint Fix All" },
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
            "eslint",
            "prettierd",
          },
        }
      end,
    },
    { "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" },
  },
}
