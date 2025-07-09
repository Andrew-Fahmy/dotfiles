vim.api.nvim_create_user_command("Light", function()
  vim.o.background = "light"
  print("Set background to light")
end, {})

vim.api.nvim_create_user_command("Dark", function()
  vim.o.background = "dark"
  print("Set background to dark")
end, {})

vim.api.nvim_create_user_command("Colorscheme", function()
    Snacks.picker.colorschemes()
end, {})


