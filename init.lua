-- Load settings
	require("settings")

----------------------------------------------------------------------

-- Make lazy "listen" for spec(It specyfies what modules to import)
	require("Lazy.launch")


-- Load Lazy modules
	-- Load ColorSchemes
		spec("ColorSchemes.gruvbox")

	-- Load TreeSitter
	-- To make TreeSitter work in more langs add langs to ensure_installed in ./lua/Plugins/treesitter.lua
		spec("Plugins.treesitter")

	-- Load nTree
		spec("Plugins.ntree")

	-- Load Harpoon
		spec("Plugins.harpoon")

	-- Load TeleScope
		spec("Plugins.telescope")

	-- Load Undotree
		spec("Plugins.undotree")

	-- Load Mason
		spec("Plugins.mason")

-- "Launch" lazy
	require("Lazy.lazy")

----------------------------------------------------------------------

-- Load keymaps
	require("keymaps")

----------------------------------------------------------------------

-- Run Scheme(If you want different scheme to run when launching chainge gruvbox to any other colorscheme)
	vim.cmd("colorscheme gruvbox")
