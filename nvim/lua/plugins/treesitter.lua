return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  config = function()
  require'nvim-treesitter'.setup {
  }

	require'nvim-treesitter'.install {  'c_sharp', 'razor', 'html', 'svelte', 'typescript' }

  vim.api.nvim_create_autocmd('FileType', {
    pattern = {  'c_sharp', 'razor', 'html', 'svelte', 'typescript' },
    callback = function()
      vim.treesitter.start()
      -- vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
      -- vim.wo.foldmethod = 'expr'
      -- vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end,
  })

  end
}
