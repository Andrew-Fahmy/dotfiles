return {
  'stevearc/oil.nvim',
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false,
  config = function ()
    require('oil').setup()
    local oil = require('oil')
    vim.keymap.set('n', '<leader>b', function()
      oil.open()
    end)
  end
}
