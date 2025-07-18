vim.api.nvim_create_user_command("Light", function()
  vim.o.background = "light"
end, {})

vim.api.nvim_create_user_command("Dark", function()
  vim.o.background = "dark"
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
  pattern = "NeogitCommitMessage",
  callback = function()
    vim.opt_local.spell = true
  end,
})
