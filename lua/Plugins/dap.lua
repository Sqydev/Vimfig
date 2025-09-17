local Dap = {
	"mfussenegger/nvim-dap",
	lazy = false,
	dependencies = {
        "rcarriga/nvim-dap-ui",
        "theHamsta/nvim-dap-virtual-text",
    },

	config = function ()
		local dap = require("dap")
		
		-- Here config(empty for now)


		-- UI
		require("dapui").setup()
        require("nvim-dap-virtual-text").setup()
	end
}

return Dap
