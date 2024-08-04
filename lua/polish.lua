vim.api.nvim_create_user_command("BiomeCheckCurrentFile", function()
  local biomePath = vim.fn.getcwd() .. "/node_modules/@biomejs/biome/bin/biome"
  vim.cmd("! " .. biomePath .. " check % --write")
  vim.cmd "e"
end, {})
