vim.api.nvim_create_user_command("Light", function()
  vim.api.nvim_set_option_value("background", "light", {})
end, {})

vim.api.nvim_create_user_command("Dark", function()
  vim.api.nvim_set_option_value("background", "dark", {})
end, {})

vim.api.nvim_create_user_command("Colorscheme", function()
  Snacks.picker.colorschemes()
end, {})

vim.api.nvim_create_user_command("Stash", function()
  Snacks.picker.git_stash()
end, {})

vim.api.nvim_create_user_command("Blame", ":Gitsigns blame", {})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  command = [[%s/\s\+$//e]],
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "NeogitCommitMessage", "markdown" },
  callback = function()
    vim.opt_local.spell = true
  end,
})
