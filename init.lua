-- Load settings
	require("settings")

----------------------------------------------------------------------

-- Make lazy "listen" for spec(It specyfies what modules to import)
	require("Lazy.launch")


-- Load Lazy modules
	-- NOTE: Add colorshemes HERE and make one run on init in vim.cmd("colorsheme yourcolorsheme")(you can find it in this file)
	-- Load ColorSchemes
		-- Gruvbox
			spec("ColorSchemes.gruvbox")
		-- Melange
			spec("ColorSchemes.melange")
		-- Ashen(Dark one)
			spec("ColorSchemes.ashen")
		-- Nord
			spec("ColorSchemes.nord")

	-- Load Mason
		spec("Plugins.mason")

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

	-- Load TodoComms
		spec("Plugins.todocomms")


-- "Launch" lazy
	require("Lazy.lazy")

----------------------------------------------------------------------

-- Load keymaps
	require("keymaps")

----------------------------------------------------------------------

-- Run Scheme(If you want different scheme to run when launching chainge gruvbox to any other colorscheme)
	vim.cmd("colorscheme gruvbox")
