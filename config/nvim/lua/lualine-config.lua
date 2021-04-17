require'lualine'.setup{
    options = {
        theme = 'onedark'
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch' },
        lualine_c = { 'filename' },
        lualine_x = {{ 'filetype', icons_enabled = false }},
        lualine_y = { 'encoding', { 'fileformat', icons_enabled = false }},
        lualine_z = { 'location', 'progress' }
    },
    extensions = {
        'nvim-tree',
        'fugitive'
    }
}
