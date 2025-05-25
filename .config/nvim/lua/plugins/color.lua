return {
  { "joshdick/onedark.vim" },
  { "gruvbox-community/gruvbox" },
  { "catppuccin/nvim", name = "catppuccin" },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    config = function()
      vim.cmd.colorscheme("tokyonight")
    end,
  },
}
