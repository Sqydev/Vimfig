local Snackey = {
  "folke/snacks.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("snacks").setup({})
  end,
}

return Snackey
