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

		-- C adapter conf
		dap.adapters.codelldb = {
      		type = "server",
      		port = "${port}",
      		executable = {
        		-- podaj ścieżkę do binarki "codelldb"
        		command = "codelldb",
        		args = { "--port", "${port}" },
      		},
    	}

    	-- C conf
    	dap.configurations.c = {
      	{
        	name = "Launch file",
        	type = "codelldb",
        	request = "launch",
        	program = function()
          		return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        	end,
        	cwd = "${workspaceFolder}",
    	    stopOnEntry = false,
	        terminal = "integrated",
      		},
    	}

    	-- Use C conf for cpp
    	dap.configurations.cpp = dap.configurations.c


		-- UI
		require("dapui").setup()
        require("nvim-dap-virtual-text").setup()
	end
}

return Dap
