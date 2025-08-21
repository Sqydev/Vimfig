local M = {
    'williamboman/mason.nvim',
    dependencies = {
      'williamboman/mason-lspconfig.nvim',
      'nvim-lua/plenary.nvim',
    },
}

M.servers = {
    "lua_ls",
    "rust_analyzer",
    --"clangd",
}


function M.config()
    local lsp = require("lsp-zero")

    lsp.preset("recommended")

    lsp.set_preferences({
        suggest_lsp_servers = false,
        sign_icons = {
            error = '✖',
            warn = '▲',
            hint = 'H',
            info = 'I'

        }

    })

    require("mason").setup()

    require("mason-lspconfig").setup {
        ensure_installed = M.servers,
        automatic_installation = false,
    }

    require "lsp-zero".setup()

    local lspconfig = require('lspconfig')
    lspconfig.clangd.setup({
        cmd = { "clangd", "--query-driver=/run/current-system/sw/bin/gcc" },
        mason = false,
        on_attach = lsp.on_attach,
        capabilities = lsp.capabilities,
    })

    require "mason-lspconfig".setup_handlers {
        function (server_name)
            require "lspconfig" [server_name].setup {}
        end
    }

    lsp.setup()

    vim.diagnostic.config({
        virtual_text = true
    })

end

return M
