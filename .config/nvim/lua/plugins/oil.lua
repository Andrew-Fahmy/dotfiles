return {
  'stevearc/oil.nvim',
  dependencies = { "nvim-mini/mini.nvim" },
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
