return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope-ui-select.nvim" },
    { "nvim-tree/nvim-web-devicons" },
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  config = function()
    require("telescope").setup({
      defaults = {
        vimgrep_arguments = {
          "rg",
          "--hidden",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
        },
        file_sorter = require("telescope.sorters").get_fuzzy_file,
        file_ignore_patterns = { "node_modules/*", "[.]git/*" },
        generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
        color_devicons = true,
        set_env = { ["COLORTERM"] = "truecolor" },
      },

      pickers = {
        find_files = {
          find_command = {
            "rg",
            "--hidden",
            "--files",
          },
        },
      },

      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = false,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
      },
    })

    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>fh", builtin.help_tags)
    vim.keymap.set("n", "<leader>ff", builtin.find_files)
    vim.keymap.set("n", "<leader>fg", builtin.live_grep)
    vim.keymap.set("n", "<leader>fr", builtin.resume)
    vim.keymap.set("n", "<leader>s.", builtin.oldfiles)
    vim.keymap.set("n", "<leader><leader>", builtin.buffers)
    require("telescope").load_extension("fzf")
  end,
}
