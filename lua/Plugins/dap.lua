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

		-- Python config
--		dap.configuration.python = {
--			type = 'python';
--			request = 'launch';
--			name = 'Debug Python',
--			program = "${file}",
--			pythonPatch = function()
--				-- NOTE: Do so it takes the path from your system(So it works on nixos too)
--				return '/usr/bin/python'
--			end;
--		}

		-- Here config(empty for now)


		-- UI
		require("dapui").setup()
        require("nvim-dap-virtual-text").setup()
	end
}

return Dap
