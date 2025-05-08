return {
  "stevearc/conform.nvim",
  event = "User AstroFile",
  version = vim.fn.has "nvim-0.10" ~= 1 and "7",
  cmd = "ConformInfo",
  specs = {
    { "AstroNvim/astrolsp", optional = true, opts = { formatting = { disabled = true } } },
    { "jay-babu/mason-null-ls.nvim", optional = true, opts = { methods = { formatting = false } } },
  },
  dependencies = {
    { "williamboman/mason.nvim", optional = true },
    {
      "AstroNvim/astrocore",
      opts = {
        options = { opt = { formatexpr = "v:lua.require'conform'.formatexpr()" } },
        commands = {
          Format = {
            function(args)
              local range = nil
              if args.count ~= -1 then
                local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
                range = {
                  start = { args.line1, 0 },
                  ["end"] = { args.line2, end_line:len() },
                }
              end
              require("conform").format { async = true, range = range }
            end,
            desc = "Format buffer",
            range = true,
          },
        },
        mappings = {
          n = {
            ["<Leader>F"] = { function() vim.cmd.Format() end, desc = "Format buffer" },
          },
        },
      },
    },
  },
  opts = {
    default_format_opts = { lsp_format = "fallback" },
    format_on_save = false,
    formatters_by_ft = {
      html = function(bufnr)
        local prettierCommands = require("conform").get_formatter_info("prettierd", bufnr).cwd

        if prettierCommands ~= nil then
          return {
            "prettier",
            "prettierd",
            stop_after_first = true,
          }
        else
          return { "html" }
        end
      end,
      vue = {
        "prettier",
        "prettierd",
        stop_after_first = true,
      },
    },
    log_level = vim.log.levels.DEBUG,
  },
}
