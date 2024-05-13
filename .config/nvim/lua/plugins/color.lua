return {
  { "joshdick/onedark.vim" },
  { "gruvbox-community/gruvbox" },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    config = function()
      vim.cmd.colorscheme("tokyonight")
    end,
  },
}
