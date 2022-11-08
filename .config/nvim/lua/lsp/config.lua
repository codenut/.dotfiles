require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {"sumneko_lua", "efm"},
    automatic_installation = true
})

local lsp = require "lspconfig"

vim.g.coq_settings = {keymap = {pre_select = true}, auto_start = true}

local coq = require "coq" -- add this

lsp.pyright.setup(coq.lsp_ensure_capabilities {})
lsp.tsserver.setup(coq.lsp_ensure_capabilities {})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

vim.api.nvim_set_keymap('n', ']e', '<cmd>lua vim.diagnostic.goto_next()<CR>',
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '[e', '<cmd>lua vim.diagnostic.goto_prev()<CR>',
                        {noremap = true, silent = true})

vim.lsp.handlers["textDocument/publishDiagnostics"] =
    vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics,
                 {virtual_text = false})
