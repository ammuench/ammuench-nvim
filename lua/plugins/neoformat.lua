return {
  "sbdchd/neoformat",
  name = "neoformat",
  config = function()
    vim.cmd [[
      let g:neoformat_try_node_exe = 1
      let g:neoformat_only_msg_on_error = 1
    ]]
    -- vim.cmd "autocmd BufWritePre *.vue,*.ts,*.js,*.jsx,*.tsx,*.html,*.md,*.css,*.scss,*.json Neoformat prettier"
  end,
}
