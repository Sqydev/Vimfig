local lsp_zero = require("lsp-zero")
local lspconfig = require("lspconfig")

for server, config in pairs(lspconfig) do
  if type(config) == "table" and config.document_config then
    local cmd = config.document_config.default_config.cmd
    if cmd and vim.fn.executable(cmd[1]) == 1 then
      lspconfig[server].setup({
        on_attach = lsp_zero.on_attach,
        capabilities = lsp_zero.capabilities,
      })
    end
  end
end
