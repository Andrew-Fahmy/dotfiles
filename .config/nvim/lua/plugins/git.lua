return {
  -- { "tpope/vim-fugitive" },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim"
    },
    config = function()
      local neogit = require("neogit")
      neogit.setup()
      vim.keymap.set("n", "<leader>gs", function()
        neogit.open({ kind = "split_above" })
      end)
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
  },
}
