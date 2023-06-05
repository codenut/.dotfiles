vim.keymap.set('n', '<leader>gt', ":Git ", {})
vim.keymap.set('n', '<leader>gp', ":Git push ", {})
vim.keymap.set('n', '<leader>grb', ":Git rebase -i HEAD~2", {})
vim.keymap.set('n', '<leader>lg', ":LazyGit<CR>", {})

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>ff', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})

vim.keymap.set('n', '<leader>fc', builtin.git_commits, {})
vim.keymap.set('n', '<leader>ft', builtin.git_stash, {})
vim.keymap.set('n', '<leader>bc', builtin.git_bcommits, {})

vim.keymap.set('n', '<C-h>', ":bprev<CR>", {})
vim.keymap.set('n', '<C-l>', ":bnext<CR>", {})
vim.keymap.set('n', '<leader>d', "Oimport pdb; pdb.set_trace()<Esc>", {})

