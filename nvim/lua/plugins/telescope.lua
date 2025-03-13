
-- plugins.lua
return {
  {
    "nvim-telescope/telescope.nvim",  -- Telescope plugin
    dependencies = { "nvim-lua/plenary.nvim" },  -- Plenary dependency
    config = function()
      -- Telescope setup function
      require('telescope').setup({
        defaults = {
          -- Add custom settings for Telescope here
        },
      })
    end
  }
}
