return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        -- first key is the mode
        n = {
          ["<leader>W"] = { ":noa w<cr>", desc = "Save w/o Formatting" },
          ["<leader>ff"] = {
            "<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>",
            desc = "Find Files",
          },
          ["<C-d>"] = { "<C-d>zz" },
          ["<C-u>"] = { "<C-u>zz" },
        },
        t = {
          -- setting a mapping to false will disable it
          -- ["<esc>"] = false,
        },
      },
    },
  },
  {
    "AstroNvim/astrolsp",
    ---@type AstroLSPOpts
    opts = {
      mappings = {
        n = {
          -- this mapping will only be set in buffers with an LSP attached
          ["<leader>L"] = { ":EslintFixAll<cr>", desc = "ESLint Fix All" },
          ["<leader>F"] = { ":Neoformat<cr>", desc = "Format Buffer w/ Neoformat" },
          ["<leader>B"] = { ":!biome format % --write<cr>:e<cr>", desc = "Format Buffer w/ Biome" },
          ["<leader>R"] = { ":LspRestart<cr>", desc = "Reload LSP" },
          ["<leader>uI"] = { ":IBLToggle<cr>", desc = "Toggle Rainbow Indents" },
          ["<leader>uO"] = { ":IBLToggleScope<cr>", desc = "Toggle Scope Highlights" },
          K = {
            function() vim.lsp.buf.hover() end,
            desc = "Hover symbol details",
          },
          -- condition for only server with declaration capabilities
          gD = {
            function() vim.lsp.buf.declaration() end,
            desc = "Declaration of current symbol",
            cond = "textDocument/declaration",
          },
        },
      },
    },
  },
}
