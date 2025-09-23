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

		-- auto wykrywanie codelldb
		local codelldb_path
		if vim.fn.has("unix") == 1 and vim.fn.isdirectory("/run/current-system/sw/share/vscode/extensions/vadimcn.vscode-lldb/adapter") == 1 then
			-- NixOS
			codelldb_path = "/run/current-system/sw/share/vscode/extensions/vadimcn.vscode-lldb/adapter/codelldb"
		else
			-- Inny system – wpisz swoją ścieżkę
			codelldb_path = "/usr/bin/codelldb"  -- <- zmień jeśli u Ciebie gdzie indziej
		end

		dap.adapters.codelldb = {
			type = "server",
			port = "${port}",
			executable = {
				command = codelldb_path,
				args = { "--port", "${port}" },
			},
		}

		dap.configurations.c = { {
				name = "Launch file",
				type = "codelldb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
			},
		}

		dap.configurations.cpp = dap.configurations.c


		-- UI
		require("dapui").setup()
        require("nvim-dap-virtual-text").setup()
	end
}

return Dap
