return {
  'echasnovski/mini.nvim',
  version = '*',
  config = function()
    require('mini.comment').setup()
    require('mini.icons').setup()
  end,
}
