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

		-- Experimental on nixos
		local lspconfig = require('lspconfig')
    		lspconfig.clangd.setup({
        	cmd = { "clangd", "--query-driver=/run/current-system/sw/bin/gcc" },
        	on_attach = lsp_zero.on_attach,
        	capabilities = lsp_zero.capabilities,
    	})

        require("mason").setup({})
        require("mason-lspconfig").setup({
            automatic_installation = false,
            handlers = {
                function(server_name)
                    require("lspconfig")[server_name].setup({  })
                end,
            },
        })

		-- Complition
		local cmp = require("cmp")
			cmp.setup({
				mapping = cmp.mapping.preset.insert({
                	["<CR>"] = cmp.mapping.confirm({ select = true }),
                	["<C-Tab>"] = cmp.mapping.select_next_item(),
            	}),

    			sources = {
        			{ name = "nvim_lsp" },
        			{ name = "buffer" },
        			{ name = "path" },
    			},
			})

        vim.diagnostic.config({
            virtual_text = false,
			signs = {
				-- From what level of diagnostic it should show sign
				severity = {
					-- Lowest level possible
            		min = vim.diagnostic.severity.HINT,
        		},

				-- Chainge sign's icons
        		text = {
            		[vim.diagnostic.severity.ERROR] = '⬤',
            		[vim.diagnostic.severity.WARN] = '⬤',
            		[vim.diagnostic.severity.HINT] = '⬤',
            		[vim.diagnostic.severity.INFO] = '⬤',
        		},
			},
            underline = true,
            update_in_insert = true,
            severity_sort = true,
        })
    end,
}

return Mason

