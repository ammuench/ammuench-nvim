return {
  "pmizio/typescript-tools.nvim",
  dependencies = {
    ---@type AstroLSPOpts
    "AstroNvim/astrolsp",
    optional = true,
    ---@diagnostic disable: missing-fields
    opts = {
      handlers = { tsserver = false }, -- disable tsserver setup, this plugin does it
      config = {
        ["typescript-tools"] = { -- enable inlay hints by default for `typescript-tools`
          settings = {
            tsserver_file_preferences = {
              includeInlayParameterNameHints = "all",
              includeInlayParameterNameHintsWhenArgumentMatchesName = false,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayVariableTypeHints = true,
              includeInlayVariableTypeHintsWhenTypeMatchesName = false,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayEnumMemberValueHints = true,
            },
          },
        },
      },
    },
  },
  settings = {
    tsserver_plugins = {
      "@styled/typescript-styled-plugin",
    },
  },
  ft = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
  -- get AstroLSP provided options like `on_attach` and `capabilities`
  opts = function()
    local astrolsp_avail, astrolsp = pcall(require, "astrolsp")
    if astrolsp_avail then return astrolsp.lsp_opts "typescript-tools" end
  end,
}
