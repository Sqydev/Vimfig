-- Schema
-- vim.keymap.set("mode first letter", "input to activate", whattodo)

-- Harpoon keymap
local mark = require "harpoon.mark"
local ui = require "harpoon.ui"
local term = require "harpoon.term"
vim.keymap.set("n", "<leader>e", ui.toggle_quick_menu, {})
vim.keymap.set("n", "<leader>a", mark.add_file, {})
vim.keymap.set("n", "<leader>c", function()
   term.gotoTerminal(1)
end)

-- TeleScope
local telescope_func = require "telescope.builtin"
vim.keymap.set("n", "<leader>pf", telescope_func.find_files, {})

-- UndoTree && nTree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

vim.keymap.set("n", "<leader>tf", ":NvimTreeFocus<CR>")
vim.keymap.set("n", "<leader>tt", ":NvimTreeToggle<CR>")
