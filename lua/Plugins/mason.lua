local Mason = {
    "williamboman/mason.nvim",
    dependencies = {
        -- Lsp
		"williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
        "VonHeikemen/lsp-zero.nvim",

		-- Complition
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-nvim-lua",
		"L3MON4D3/LuaSnip"
    },
    config = function()
        local lsp_zero = require("lsp-zero")

        lsp_zero.on_attach(function(_, bufnr)
            lsp_zero.default_keymaps({buffer = bufnr})
        end)

        require("mason").setup({})
        require("mason-lspconfig").setup({
            automatic_installation = false,
            handlers = {
                function(server_name)
                    require("lspconfig")[server_name].setup({  })
                end,
            },
        })

		local cmp = require("cmp")
			cmp.setup({
				mapping = cmp.mapping.preset.insert({
                	["<C-CR>"] = cmp.mapping.confirm({ select = true }),
                	["<C-Tab>"] = cmp.mapping.select_next_item(),
            	}),

    			sources = {
        			{ name = "nvim_lsp" },
        			{ name = "buffer" },
        			{ name = "path" },
    			},
			})

        vim.diagnostic.config({
            virtual_text = true,
            signs = true,
            underline = true,
            update_in_insert = false,
            severity_sort = true,
        })
    end,
}

return Mason

