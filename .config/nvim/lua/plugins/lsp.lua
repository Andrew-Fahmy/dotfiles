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

    vim.diagnostic.config({
      float = {
        focusable = false,
        style = "minimal",
        source = "always",
      },
    })

    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(e)
        local opts = { buffer = e.buf }
        -- vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        -- vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
        -- vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
        -- vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>vs", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "<leader>va", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>r", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
      end,
    })
  end,
}
