local Harpoon = {
    "ThePrimeagen/harpoon",
    dependencies = { "nvim-lua/plenary.nvim" },
	lazy = false,
    config = function()
        require("harpoon").setup()
    end,
}
return Harpoon

