vim.api.nvim_create_user_command("Light", function()
  vim.o.background = "light"
end, {})

vim.api.nvim_create_user_command("Dark", function()
  vim.o.background = "dark"
end, {})

vim.api.nvim_create_user_command("Colorscheme", function()
  require('snacks').picker.colorschemes()
end, {})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  command = [[%s/\s\+$//e]],
})
