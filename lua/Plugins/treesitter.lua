local TreeSitter = {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = false,
  config = function()
    require('nvim-treesitter').setup({
      install_dir = vim.fn.stdpath('data') .. '/site'
    })

    require('nvim-treesitter').install({ 
      'c', 'cpp', 'rust', 'lua', 'python', 'javascript', 'bash', 'c_sharp', 'java' 
    })

    vim.api.nvim_create_autocmd('FileType', {
      pattern = { 'c', 'cpp', 'lua', 'rust', 'python', 'java' },
      callback = function()
        vim.treesitter.start()
      end,
    })

    vim.api.nvim_create_autocmd('FileType', {
      pattern = { 'c', 'cpp', 'lua', 'rust' },
      callback = function()
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}

return TreeSitter
