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
          ["<leader>L"] = {
            ":EslintFixAll<cr>",
            desc = "ESLint Fix All",
            cond = function()
              local eslintFile = vim.fs.find({ "eslint" }, { path = vim.fn.getcwd() })

              if next(eslintFile) == nil then
                return false
              else
                return true
              end
            end,
          },
          ["<leader>B"] = {
            ":BiomeCheckCurrentFile<cr>",
            desc = "Biome Check",
            cond = function()
              local biomeConfig = vim.fs.find({ "biome.json" }, { path = vim.fn.getcwd() })

              if next(biomeConfig) == nil then
                return false
              else
                return true
              end
            end,
          },

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
