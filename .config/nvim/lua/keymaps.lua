-- unhighlight when pressing Esc
vim.keymap.set('n', '<Esc>', '<Cmd>nohlsearch<CR>')

-- navigate quickfix list
vim.keymap.set('n', '<C-j>', '<Cmd>cnext<CR>')
vim.keymap.set('n', '<C-k>', '<Cmd>cprev<CR>')

-- copy and paste from system clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>d', '"+d')
vim.keymap.set({ 'n', 'v' }, '<leader>D', '"+D')
vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y')
vim.keymap.set({ 'n', 'v' }, '<leader>Y', '"+Y')
vim.keymap.set({ 'n', 'v' }, '<leader>p', '"+p')

-- json format
vim.keymap.set('n', '<leader>jq', ':%!jq')

vim.keymap.set('n', '<leader>gd', '<Cmd>Gitsigns preview_hunk<CR>')

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
