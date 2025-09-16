local Mason = {
	"mason-org/mason.nvim",
	opts = {}
}

function Mason.config()
	local lsp = require("Plugins.lspzero")

	lsp.preset("recommended")

	lsp.set_preferences({
        suggest_lsp_servers = true,
        sign_icons = {
            error = '✖',
            warn = '▲',
            hint = 'H',
            info = 'I'
        }
    })

	lsp.setup()

	vim.diagnostic.config({
        virtual_text = true
    })
end

return Mason
