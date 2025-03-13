-- Lazy.nvim plugin setup
return({
  -- nvim-treesitter for better syntax highlighting
  {
    'p00f/nvim-ts-rainbow',
    after = 'nvim-treesitter',  -- Make sure nvim-treesitter is loaded first
  },
})

