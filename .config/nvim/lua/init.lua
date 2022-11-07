require("plugins")

require('telescope').setup()
require'nvim-tree'.setup()
require'lualine'.setup {
    options = {
        section_separators = {left = '', right = ''},
        component_separators = {left = '', right = ''}
    }
}
require("bufferline").setup {}
require("trouble").setup()

require("lsp-custom-config")
require("lsp-format-config")

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>ff', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})

vim.keymap.set('n', '<leader>fc', builtin.git_commits, {})
vim.keymap.set('n', '<leader>ft', builtin.git_stash, {})
vim.keymap.set('n', '<leader>bc', builtin.git_bcommits, {})

vim.keymap.set('n', '<leader>fs', builtin.lsp_workspace_symbols, {})
vim.keymap.set('n', '<leader>bs', builtin.lsp_document_symbols, {})
vim.keymap.set('n', '<leader>dr', builtin.lsp_references, {})
vim.keymap.set('n', '<leader>di', builtin.lsp_implementations, {})
vim.keymap.set('n', '<leader>dd', builtin.lsp_definitions, {})
vim.keymap.set('n', '<leader>dd', builtin.lsp_type_definitions, {})
