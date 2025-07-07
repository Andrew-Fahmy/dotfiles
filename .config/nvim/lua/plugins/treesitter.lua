return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "javascript",
        "typescript",
        "html",
        "css",
        "c_sharp",
        "c",
        "lua",
        "bash",
        "go",
        "python",
      },
      auto_install = true,
      sync_install = false,

      indent = {
        enable = true,
      },

      highlight = {
        enable = true,
      },
    })
  end,
}
