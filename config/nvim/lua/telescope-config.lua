require('telescope').setup {
    defaults = {
        vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case'
        },
        file_sorter =  require'telescope.sorters'.get_fuzzy_file,
        file_ignore_patterns = { "node_modules/*", "[.]git/*" },
        generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
        color_devicons = true,
        set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    },
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = false,
            override_file_sorter = true,
            case_mode = "smart_case"
        }
    },
    find_command = {
        'rg',
        '--hidden',
        '--files'
    }
}

require('telescope').load_extension('fzf')
