-- Main entry point for LazyVim
return {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.prettier.with({
            filetypes = { "html", "hbs", "css", "javascript", "json", "yaml" },
          }),
        },
      })
    end,
}

