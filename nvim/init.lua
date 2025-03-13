-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

--function Transparent(color)
--  color = color or "tokyonight"
--  vim.cmd.colorscheme(color)
--  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
--  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
--end
--Transparent()
vim.opt.guifont = { "DroidSansM Nerd Font Mono", "h8" }
-- Reapply transparency on buffer enter

-- Set up a keybinding to start Telescope from C:\
vim.api.nvim_set_keymap(
  "n",
  "<leader>fd",
  ':lua require("telescope.builtin").find_files({ cwd = "D:\\\\" })<CR>',
  { noremap = true, silent = true }
)

require("which-key").setup({
  layout_strategy = "horizontal", -- Enforce horizontal layout
  layout_config = {
    width = 20.0, -- Set the width to 100% of the screen width
    height = { min = 5, max = 20 }, -- Set height to use more vertical space (adjust as needed)
    preview_width = 20.0, -- Optional: Adjust the width of preview (if applicable)
  },
})

vim.api.nvim_create_user_command("OpenLocalhost", function(opts)
  local port = opts.args -- Capture the port number from the command argument
  if port == "" then
    port = "3000" -- Default to 3000 if no port is provided
  end
  local url = "http://localhost:" .. port

  -- Adjust for OS (Windows: start, macOS: open, Linux: xdg-open)
  if vim.fn.has("win32") == 1 then
    os.execute("start " .. url)
  else
    os.execute("xdg-open " .. url)
  end
end, { desc = "Open localhost in browser", nargs = "?" }) -- nargs = "?" means the port is optional

vim.cmd("autocmd BufRead,BufNewFile *.hbs set filetype=html")
-- ~/.config/nvim/init.lua
vim.api.nvim_set_hl(0, "PmenuSel", { bg = "NONE" })
vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "NONE" })
vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "NONE" })

require("config.autocmds")
-- plugin/null-ls.lua

local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.prettier,
  },
})

-- Get the vscode.nvim color values
--local colors = require('vscode.colors').get_colors()
--print(vim.inspect(colors))

-- Function to apply transparency settings globally
local function set_transparency()
  vim.cmd([[
hi Normal guibg=NONE ctermbg=NONE
hi NormalNC guibg=NONE ctermbg=NONE
hi SignColumn guibg=NONE ctermbg=NONE
hi StatusLine guibg=NONE ctermbg=NONE
hi StatusLineNC guibg=NONE ctermbg=NONE
hi VertSplit guibg=NONE ctermbg=NONE
hi TabLine guibg=NONE ctermbg=NONE
hi TabLineFill guibg=NONE ctermbg=NONE
hi TabLineSel guibg=NONE ctermbg=NONE
hi Pmenu guibg=NONE ctermbg=NONE
hi PmenuSel guibg=NONE ctermbg=NONE
hi NeoTreeNormal guibg=NONE ctermbg=NONE
hi NeoTreeNormalNC guibg=NONE ctermbg=NONE
hi NeoTreeWinSeparator guibg=NONE ctermbg=NONE
hi NeoTreeEndOfBuffer guibg=NONE ctermbg=NONE
hi EndOfBuffer guibg=NONE ctermbg=NONE
]])
end

-- Apply transparency settings initially
set_transparency()

-- Reapply transparency on buffer enter
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  callback = set_transparency,
})


