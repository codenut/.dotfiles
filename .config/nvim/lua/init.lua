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

require("lsp/config")
require("lsp/format")
require("key-mappings")
