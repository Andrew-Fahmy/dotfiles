return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require("lualine").setup({
      sections = {
        lualine_a = { "mode" },
        lualine_b = {
          "branch",
        },
        lualine_c = {
          {
            "filename",
            path = 1,
          },
        },
        lualine_x = { "filetype" },
        lualine_y = { "encoding", { "fileformat", icons_enabled = false } },
        lualine_z = { "location", "progress" },
      },
    })
  end,
}
