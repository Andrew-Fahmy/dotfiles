return {
  'nvim-treesitter/nvim-treesitter',
  branch = 'main',
  lazy = false,
  build = ':TSUpdate',
  config = function()
    require("nvim-treesitter").install({
      "javascript",
      "typescript",
      "json",
      "html",
      "css",
      "c_sharp",
      "c",
      "lua",
      "bash",
      "go",
      "python",
      "regex",
    })

    vim.api.nvim_create_autocmd("FileType", {
      callback = function(e)
        if pcall(vim.treesitter.start, e.buf) then
          vim.bo[e.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
      end,
    })
  end,
}
