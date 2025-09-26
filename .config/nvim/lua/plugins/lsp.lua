return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "mason-org/mason.nvim" },
    { "mason-org/mason-lspconfig.nvim" },
    {
      'saghen/blink.cmp',
      dependencies = { 'rafamadriz/friendly-snippets' },
      version = '1.*',
      opts = {
        keymap = { preset = 'default' },
      }
    },
    "j-hui/fidget.nvim",
  },

  config = function()
    require("fidget").setup()
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "vtsls",
        -- "ts_ls",
        "tailwindcss",
        "omnisharp",
        -- "csharp_ls@0.10.0",
        "bashls",
        "pyright",
        "clangd",
        "lua_ls",
        "html",
        "prismals"
      },
    })

    local pid = vim.fn.getpid()
    local omnisharp_bin = "/home/andrew/.local/share/nvim/mason/bin/OmniSharp"
    vim.lsp.config["omnisharp"] = {
      cmd = { omnisharp_bin, "--languageserver" , "--hostPID", tostring(pid) };
    }
  end,
}
