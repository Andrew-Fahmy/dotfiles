return {
  'stevearc/oil.nvim',
  dependencies = { "echasnovski/mini.icons" },
  lazy = false,
  config = function ()
    require('oil').setup()
    local oil = require('oil')
    vim.keymap.set('n', '<leader>b', function()
      oil.open()
    end)
  end
}
