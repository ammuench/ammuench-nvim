---@type LazySpec
return {
  -- use mason-tool-installer for automatically installing Mason packages
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    -- overrides `require("mason-tool-installer").setup(...)`
    opts = {
      -- Make sure to use the names found in `:Mason`
      ensure_installed = {
        -- install language servers
        -- "astro-language-server",
        "css-lsp",
        -- "gopls",
        "html-lsp",
        "json-lsp",
        "lua-language-server",
        "tailwindcss-language-server",
        "vtsls",
        -- "vue-language-server",

        -- install linters, formatters
        "biome",
        "eslint-lsp",
        "prettierd",
        "stylua",

        -- install debuggers
        "js-debug-adapter",

        -- install any other package
        "tree-sitter-cli",
      },
    },
  },
}
