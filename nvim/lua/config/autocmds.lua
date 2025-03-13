-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
local function save()
  local buf = vim.api.nvim_get_current_buf()

  vim.api.nvim_buf_call(buf, function()
    vim.cmd("silent! write")
  end)
end

vim.api.nvim_create_augroup("AutoSave", {
  clear = true,
})

vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
  callback = function()
    save()
  end,
  pattern = "*",
  group = "AutoSave",
})

-- Autoformat HTML before saving
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.html",
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})

vim.api.nvim_create_autocmd('QuitPre', {
  callback = function()
    os.execute('del /Q "C:\\Users\\u\\AppData\\Local\\nvim-data\\shada\\main.shada.tmp.*"')
  end,
})
