local TinyInlineDiagnostic = {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy",
    priority = 1000,
    config = function()
		-- Config
        require('tiny-inline-diagnostic').setup({
			-- Set style to modern
			preset = "modern",

			-- Make bg non transparent
    		transparent_bg = false,

			options = {
				-- Add messages to diagnostics when multiline diagnostics are enabled
        		-- If set to false, only signs will be displayed
        		add_messages = true,

				-- Make it also work in other modes
				enable_on_insert = true,
        		enable_on_select = true,
			},
		})

		-- NOTE: Disable default virtual text if it's enabled somewere else
        vim.diagnostic.config({ virtual_text = false })
    end
}

return TinyInlineDiagnostic
