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
    local capabilities = require('blink.cmp').get_lsp_capabilities(vim.lsp.protocol.make_client_capabilities())

    require("fidget").setup()
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "ts_ls",
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
      handlers = {
        function(server_name)
          require("lspconfig")[server_name].setup({
            capabilities = capabilities,
          })
        end,
      },
    })

    local pid = vim.fn.getpid()
    local omnisharp_bin = "/home/andrew/.local/share/nvim/mason/bin/OmniSharp"
    require("lspconfig").omnisharp.setup({
      cmd = { omnisharp_bin, "--languageserver" , "--hostPID", tostring(pid) };
    })
  end,
}
