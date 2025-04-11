local TreeSitter = {
    "nvim-treesitter/nvim-treesitter",
    build = "TSUpdate",
	lazy = false,
}

function TreeSitter.config()
    require "nvim-treesitter.configs".setup {
        ensure_installed = {"c", "c_sharp", "rust", "java", "python", "javascript", "lua", "bash"},
        sync_install = true,
        auto_install = true,
        highlight = {enable = true},
        indent = {enable = true},
    }
end

return TreeSitter
