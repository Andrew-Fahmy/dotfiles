return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require("lualine").setup({
      options = {
        section_separators = { "", "" },
        component_separators = { "┃", "┃" },
        --section_separators = {'', ''},
        --component_separators = {'', ''},
        theme = "tokyonight",
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = {
          "branch",
          fmt = function(display_string, context)
            if #display_string > 20 then
              return display_string:sub(1, 20) .. '...'
            else
              return display_string
            end
          end,
        },
        --lualine_b = {{ 'branch', icon = '' }},
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
      extensions = {
        "fugitive",
      },
    })
  end,
}
