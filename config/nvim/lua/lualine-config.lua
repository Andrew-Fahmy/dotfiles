require'lualine'.setup{
    options = {
        section_separators = {'', ''},
        component_separators = {'┃', '┃'},
        --section_separators = {'', ''},
        --component_separators = {'', ''},
        theme = 'tokyonight'
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = {{ 'branch' }},
        --lualine_b = {{ 'branch', icon = '' }},
        lualine_c = { 'filename' },
        lualine_x = { 'filetype' },
        lualine_y = { 'encoding', { 'fileformat', icons_enabled = false }},
        lualine_z = { 'location', 'progress' }
    },
    extensions = {
        'nvim-tree',
        'fugitive'
    }
}
