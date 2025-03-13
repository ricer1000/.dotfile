-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
local Util = require("lazyvim.util")
local lazyterm = function()
  Util.terminal(nil, { cwd = Util.root() })
end
local map = LazyVim.safe_keymap_set
local keymap = vim.keymap
-- Add any additional keymaps here kjfk

map("i", "jj", "<ESC><right>")
map("n", "0", "0")
map("n", "00", "$")
map("v", "00", "$")
map("v", "gj", "G")
map("v", ";", "<ESC>")
map("n", "tt", "~")
map("n", ",", ":qa!")
map("n", "\\", "ysiw")

map("n", "qq", "<C-W>w")
map("t", "qq", "<C-W>w")
keymap.set("n", "t", lazyterm, { desc = "Terminal (root dir)" })
map("t", "qq", "<cmd>close<cr>", { desc = "Hide Terminal" })
map("n", "vv", "V")
map("n", "nn", '"+P')
map("n", "yy", '"+y')
map("n", "gj", "G")
--vim.keymap.set("n", "<Leader>fD", function() require('plugins.telescope').Cd('$HOME') end, { })
--vim.keymap.set("n", "<Leader>fd", function() require('plugins.telescope').Cd() end, { })

vim.keymap.set("n", "mm", "i<CR><Esc>", { noremap = true, silent = true })

map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")
vim.api.nvim_set_keymap("t", ",", [[<C-\><C-n>:set number<CR>]], { noremap = true, silent = true })

vim.keymap.set(
  "n",
  "<leader>sg",
  "<cmd>lua require('telescope.builtin').live_grep({additional_args = {'--hidden'}})<cr>"
)
