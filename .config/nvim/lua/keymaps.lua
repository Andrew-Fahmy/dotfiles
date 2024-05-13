-- unhighlight when pressing Esc
vim.keymap.set('n', '<Esc>', ':nohlsearch<CR>')

-- navigate quickfix list
vim.keymap.set('n', '<C-j>', ':cnext')
vim.keymap.set('n', '<C-k>', ':cprev')

-- copy and paste from system clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y')
vim.keymap.set({ 'n', 'v' }, '<leader>Y', '"+Y')
vim.keymap.set({ 'n', 'v' }, '<leader>p', '"+p')

-- json format
vim.keymap.set('n', '<leader>jq', ':%!jq')
