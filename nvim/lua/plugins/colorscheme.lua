--return {
--  "tokyonight.nvim",
--  lazy = true,
--  priority = 1000,
--  opts = function()
--    return {
--      transparent = true,
--      styles = {
--        sidebars = "transparent",
--        floats = "transparent",
--      },
--    }
--  end,
--}
-- lazy
--return{
--    "gamunu/vscode.nvim",
--    priority = 100,
--    config = function()
--        vim.cmd([[colorscheme vscode]])
--    vim.o.termguicolors = true
--    end,
--}
return{
    "gamunu/vscode.nvim",
    priority = 100,
    config = function()
        -- Set the colorscheme first
        vim.cmd([[colorscheme vscode]])

        -- Use vscode.utils to set a custom highlight for Variable
        require("vscode.utils").hl.set("Variable", { fg = "#ADD8E6" })  -- Set variable color to light blue

        -- Optionally, if you want to link it to another highlight group, you could do that too
        -- require("vscode.utils").hl.link("Variable", "SomeOtherGroup")
    end,
}

