-- Experimental on nixos
local lsp_zero = require('lsp-zero')

vim.lsp.config("clangd", {
    cmd = { "clangd", "--query-driver=/run/current-system/sw/bin/gcc" },
    on_attach = lsp_zero.on_attach,
    capabilities = lsp_zero.capabilities,
})
