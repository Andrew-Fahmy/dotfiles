return {
  {
    "stevearc/conform.nvim",
    config = function()
      local conform = require("conform")

      conform.setup({
        formatters_by_ft = {
          javascript = { "prettier" },
          typescript = { "prettier" },
          javascriptreact = { "prettier" },
          typescriptreact = { "prettier" },
          css = { "prettier" },
          html = { "prettier" },
          json = { "prettier" },
          yaml = { "prettier" },
          markdown = { "prettier" },
          lua = { "stylua" },
        },
      })
      vim.keymap.set({ "n", "v" }, "<leader>fm", function()
        conform.format({
          lsp_fallback = false,
          async = false,
          timeout_ms = 500,
        })
      end)
    end,
  },
  --{
  --  "mfussenegger/nvim-lint",
  --  config = function()
  --    local lint = require("lint")

  --    lint.linters_by_ft = {
  --      javascript = { "eslint_d" },
  --      typescript = { "eslint_d" },
  --      javascriptreact = { "eslint_d" },
  --      typescriptreact = { "eslint_d" },
  --      svelte = { "eslint_d" },
  --      python = { "pylint" },
  --    }

  --    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

  --    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
  --      group = lint_augroup,
  --      callback = function()
  --        lint.try_lint()
  --      end,
  --    })

  --    vim.keymap.set("n", "<leader>l", function()
  --      lint.try_lint()
  --      end, { desc = "Trigger linting for current file" })
  --  end,
  --},
}
