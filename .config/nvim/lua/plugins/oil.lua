return {
  'stevearc/oil.nvim',
  dependencies = { "echasnovski/mini.icons" },
  lazy = false,
  config = function ()
    local oil = require('oil')
    oil.setup({
      view_options = {
        show_hidden = true
      }
    })

    vim.keymap.set('n', '<leader>b', function()
      oil.open()
    end)
  end
}
