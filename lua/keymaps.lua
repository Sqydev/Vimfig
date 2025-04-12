--Deafult
vim.keymap.set("n", "<leader>px", vim.cmd.Ex)
vim.keymap.set("n", "<leader>cc", ":bd!<CR>")

--Telescope
local builtin = require "telescope.builtin"
vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
vim.keymap.set("n", "<C-g>", builtin.git_files, {})
vim.keymap.set("n", "<leader>ps", function()
   builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

--Harpoon
local mark = require "harpoon.mark"
local ui = require "harpoon.ui"
local term = require "harpoon.term"
vim.keymap.set("n", "<leader>e", ui.toggle_quick_menu, {})
vim.keymap.set("n", "<leader>a", mark.add_file, {})
vim.keymap.set("n", "<C-j>", ui.nav_next, {})
vim.keymap.set("n", "<C-k>", ui.nav_prev, {})
vim.keymap.set("n", "<leader>c", function()
   term.gotoTerminal(1)
end)

--UndoTree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

--Lsp
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol)
vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_next)
vim.keymap.set("n", "]d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action)
vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references)
vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename)

--Tree
vim.keymap.set("n", "<leader>tf", ":NvimTreeFocus<CR>")
vim.keymap.set("n", "<leader>tt", ":NvimTreeToggle<CR>")
