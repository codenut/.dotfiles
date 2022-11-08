require("lsp-format").setup {
    typescript = {tab_width = 4},
    yaml = {tab_width = 2}
}

local prettier = {
    formatCommand = [[prettier --config ~/.dotfiles/.config/npm/.prettierrc.json --stdin-filepath ${INPUT} ${--tab-width:tab_width}]],
    formatStdin = true
}

require("lspconfig").efm.setup {
    on_attach = require("lsp-format").on_attach,
    init_options = {documentFormatting = true},
    settings = {
        languages = {
            python = {
                {formatCommand = [[black --quiet -]], formatStdin = true},
                {formatCommand = [[isort --quiet -]], formatStdin = true}
            },
            lua = {{formatCommand = 'lua-format -i', formatStdin = true}},
            typescript = {prettier},
            typescriptreact = {prettier},
            javascript = {prettier},
            yaml = {prettier}
        }
    }
}

--[[
lsp,formatters:
lua-language-server
vim-language-server
black
efm
eslint_d
isort
luaformatter
prettier
pyright
typescript-language-server
]]

