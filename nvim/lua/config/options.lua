-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

-- Add any additional options here
vim.opt.number = true
vim.opt.swapfile = false

vim.opt.relativenumber = false
vim.opt.guicursor = "n-v-c:block-Cursor"
vim.opt.guicursor = "i-ci:block-Cursor-blinkwait700-blinkoff400-blinkon250"

vim.opt.shell = "pwsh.exe"
vim.opt.shellcmdflag =
  "-NoLogo -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();$PSDefaultParameterValues['Out-File:Encoding']='utf8';"
vim.cmd("cd %:p:h")
vim.opt.autochdir = true
-- Enable cursorline
vim.o.cursorline = false
vim.opt.autoindent = true
-- Set foldmethod to manual for LazyVim in init.lua
vim.opt.foldmethod = "manual" -- Allow manual folding
vim.opt.foldlevel = 99 -- Make sure folds are open by default
vim.o.spell = true
vim.o.spellfile = vim.fn.expand('~/AppData/Local/nvim/spell/en.utf-8.add')
vim.opt.showtabline = 0
