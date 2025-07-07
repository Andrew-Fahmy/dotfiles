require("options")
require("keymaps")
require("commands")
require("lazy-init")

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  command = [[%s/\s\+$//e]],
})
