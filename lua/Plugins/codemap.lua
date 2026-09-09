local Codemap = {
	"m2k3d/codemap",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	cmd = { "CodemapOpen", "CodemapToggle", "CodemapClose" },
	lazy = true;
	opts = {
		width = 30, -- sidebar width, columns
		update_events = { "BufEnter", "TextChanged", "TextChangedI" }, -- when to refresh the list
		debounce_ms = 300, -- delay before re-parsing after a text edit
	},
}

return Codemap
