local TeleScope = {
	"nvim-telescope/telescope.nvim",
    dependencies = {
		'nvim-lua/plenary.nvim',
		'BurntSushi/ripgrep',
		'sharkdp/fd'
	},
    lazy = true,
    cmd = "Telescope",
}

return TeleScope
