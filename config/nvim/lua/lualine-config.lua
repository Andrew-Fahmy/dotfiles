require'lualine'.setup{
    options = {
        theme = 'gruvbox'
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch' },
        lualine_c = { 'filename' },
        lualine_x = { 'encoding', { 'fileformat', icons_enabled = false }},
        lualine_y = {{ 'filetype', icons_enabled = false }},
        lualine_z = { 'location', 'progress' }
    },
    extensions = {
        'nvim-tree',
        'fugitive'
    }
}
