local Dap = {
	"mfussenegger/nvim-dap",
	lazy = false,
	dependencies = {
        "rcarriga/nvim-dap-ui",
        "theHamsta/nvim-dap-virtual-text",
		"nvim-neotest/nvim-nio",
    },

	config = function()
		local dap = require("dap")

		-- ASK GOOGLE HOW TO SET THIS UP
    	-- C conf
    	dap.configurations.c = {
    	}

    	-- Use C conf for cpp
    	dap.configurations.cpp = dap.configurations.c


		-- UI
		require("dapui").setup()
        require("nvim-dap-virtual-text").setup()
	end
}

return Dap
