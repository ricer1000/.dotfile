--vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")
--
--local state = {
--  floating = {
--    buf = -1,
--    win = -1,
--  }
--}
--
--local function create_floating_window(opts)
--  opts = opts or {}
--  local width = opts.width or math.floor(vim.o.columns * 0.8)
--  local height = opts.height or math.floor(vim.o.lines * 0.8)
--
--  -- Calculate the position to center the window
--  local col = math.floor((vim.o.columns - width) / 2)
--  local row = math.floor((vim.o.lines - height) / 2)
--
--  -- Create a buffer
--  local buf = nil
--  if vim.api.nvim_buf_is_valid(opts.buf) then
--    buf = opts.buf
--  else
--    buf = vim.api.nvim_create_buf(false, true) -- No file, scratch buffer
--  end
--
--  -- Define window configuration
--  local win_config = {
--    relative = "editor",
--    width = width,
--    height = height,
--    col = col,
--    row = row,
--    style = "minimal", -- No borders or extra UI elements
--    border = "rounded",
--  }
--
--  -- Create the floating window
--  local win = vim.api.nvim_open_win(buf, true, win_config)
--
--  return { buf = buf, win = win }
--end
--
--local toggle_terminal = function()
--  if not vim.api.nvim_win_is_valid(state.floating.win) then
--    state.floating = create_floating_window { buf = state.floating.buf }
--    if vim.bo[state.floating.buf].buftype ~= "terminal" then
--      vim.cmd.terminal()
--    end
--  else
--    vim.api.nvim_win_hide(state.floating.win)
--  end
--end
--
---- Store the initial terminal's directory
--local terminal_dir = nil
--
---- Autocmd to store the current directory the first time the terminal is opened
--vim.api.nvim_create_autocmd('TermOpen', {
--  pattern = '*',
--  callback = function()
--    if terminal_dir == nil then
--      terminal_dir = vim.fn.getcwd()  -- Store the current working directory
--    end
--  end
--})
--
---- Autocmd to set the terminal's directory to the stored one when a new terminal is opened
--vim.api.nvim_create_autocmd('TermOpen', {
--  pattern = '*',
--  callback = function()
--    if terminal_dir then
--      -- Change the terminal's directory to the stored one
--      vim.cmd('lcd ' .. terminal_dir)
--    end
--  end
--})
--
---- Example usage:
--vim.keymap.set("n", "<Tab>", ":Floaterminal<CR>", { noremap = true, silent = true })
---- Create a floating window with default dimensions
--vim.api.nvim_create_user_command("Floaterminal", toggle_terminal, {})

--vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")
--
--local state = {
--  floating = {
--    buf = -1,
--    win = -1,
--  }
--}
--
--local terminal_dir = vim.fn.getcwd() -- Store the current working directory globally
--
--local function create_floating_window(opts)
--  opts = opts or {}
--  local width = opts.width or math.floor(vim.o.columns * 0.8)
--  local height = opts.height or math.floor(vim.o.lines * 0.8)
--
--  -- Calculate the position to center the window
--  local col = math.floor((vim.o.columns - width) / 2)
--  local row = math.floor((vim.o.lines - height) / 2)
--
--  -- Create a buffer
--  local buf = nil
--  if vim.api.nvim_buf_is_valid(opts.buf) then
--    buf = opts.buf
--  else
--    buf = vim.api.nvim_create_buf(false, true) -- No file, scratch buffer
--  end
--
--  -- Define window configuration
--  local win_config = {
--    relative = "editor",
--    width = width,
--    height = height,
--    col = col,
--    row = row,
--    style = "minimal", -- No borders or extra UI elements
--    border = "rounded",
--  }
--
--  -- Create the floating window
--  local win = vim.api.nvim_open_win(buf, true, win_config)
--
--  return { buf = buf, win = win }
--end
--
--local function toggle_terminal()
--  if not vim.api.nvim_win_is_valid(state.floating.win) then
--    state.floating = create_floating_window { buf = state.floating.buf }
--    if vim.bo[state.floating.buf].buftype ~= "terminal" then
--      vim.cmd.terminal()
--    end
--  else
--    vim.api.nvim_win_hide(state.floating.win)
--  end
--end
--
---- Autocmd to store the current directory the first time the terminal is opened
--vim.api.nvim_create_autocmd('TermOpen', {
--  pattern = '*',
--  callback = function()
--    if terminal_dir == nil then
--      terminal_dir = vim.fn.getcwd()  -- Store the current working directory
--    end
--  end
--})
--
---- Autocmd to set the terminal's directory to the stored one when a new terminal is opened
--vim.api.nvim_create_autocmd('TermOpen', {
--  pattern = '*',
--  callback = function()
--    if terminal_dir then
--      -- Change the terminal's directory to the stored one
--      vim.cmd('lcd ' .. terminal_dir)
--    end
--  end
--})
--
---- New floating terminal with the current working directory (Ctrl-N)
--local function open_new_floater_with_cwd()
--  local new_term = create_floating_window({ buf = state.floating.buf })
--  state.floating.buf = new_term.buf
--  state.floating.win = new_term.win
--  vim.cmd.terminal()
--  vim.cmd('lcd ' .. terminal_dir)  -- Set the terminal's directory to the stored one
--end
--
---- Keybind for opening a new floating terminal with Ctrl-N
--vim.keymap.set("n", "<C-N>", open_new_floater_with_cwd, { noremap = true, silent = true })
--
---- Example keybind to toggle terminal visibility with Tab (optional)
--vim.keymap.set("n", "<Tab>", ":Floaterminal<CR>", { noremap = true, silent = true })
--
---- User command to toggle the terminal window
--vim.api.nvim_create_user_command("Floaterminal", toggle_terminal, {})

vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")

local state = {
  floating = {
    buf = -1,
    win = -1,
  }
}

local terminal_dir = vim.fn.getcwd() -- Store the current working directory globally

-- Function to create a floating window
local function create_floating_window(opts)
  opts = opts or {}
  local width = opts.width or math.floor(vim.o.columns * 0.8)
  local height = opts.height or math.floor(vim.o.lines * 0.8)
  local col = math.floor((vim.o.columns - width) / 2)
  local row = math.floor((vim.o.lines - height) / 2)

  local buf = nil
  if vim.api.nvim_buf_is_valid(opts.buf) then
    buf = opts.buf
  else
    buf = vim.api.nvim_create_buf(false, true) -- Create a scratch buffer
  end

  local win_config = {
    relative = "editor",
    width = width,
    height = height,
    col = col,
    row = row,
    style = "minimal",
    border = "rounded",
  }

  local win = vim.api.nvim_open_win(buf, true, win_config)

  return { buf = buf, win = win }
end

-- Function to toggle the terminal window
local function toggle_terminal()
  if not vim.api.nvim_win_is_valid(state.floating.win) then
    state.floating = create_floating_window { buf = state.floating.buf }
    if vim.bo[state.floating.buf].buftype ~= "terminal" then
      vim.cmd.terminal()
    end
  else
    vim.api.nvim_win_hide(state.floating.win)
  end
end

-- Autocmd to set the terminal's working directory
vim.api.nvim_create_autocmd('TermOpen', {
  pattern = '*',
  callback = function()
    if terminal_dir == nil then
      terminal_dir = vim.fn.getcwd()
    end
  end
})

vim.api.nvim_create_autocmd('TermOpen', {
  pattern = '*',
  callback = function()
    if terminal_dir then
      vim.cmd('lcd ' .. terminal_dir)
    end
  end
})

-- Function to open a new floating terminal with the current working directory
local function open_new_floater_with_cwd()
  local new_term = create_floating_window({ buf = state.floating.buf })
  state.floating.buf = new_term.buf
  state.floating.win = new_term.win
  vim.cmd.terminal()
  vim.cmd('lcd ' .. terminal_dir)
end

-- Keybinding to open new floating terminal with Ctrl-N
vim.keymap.set("n", "<C-N>", open_new_floater_with_cwd, { noremap = true, silent = true })

-- Keybinding to toggle terminal visibility with Tab (optional)
vim.keymap.set("n", "<Tab>", ":Floaterminal<CR>", { noremap = true, silent = true })

-- Function to kill the terminal (exit and delete buffer)
local function kill_terminal()
  -- Check if the terminal window exists and is valid
  if vim.api.nvim_win_is_valid(state.floating.win) then
    -- First, exit terminal mode
    vim.api.nvim_feedkeys("<C-\\><C-n>", "n", true)

    -- Close the terminal window and delete the buffer
    vim.api.nvim_win_close(state.floating.win, true)
    vim.api.nvim_buf_delete(state.floating.buf, { force = true })

    -- Reset state to reflect that there's no active terminal
    state.floating.buf = -1
    state.floating.win = -1
  end
end

-- Keybinding to kill the terminal with Ctrl-Q
vim.keymap.set("t", "qq", kill_terminal, { noremap = true, silent = true })

-- User command to toggle the terminal window
vim.api.nvim_create_user_command("Floaterminal", toggle_terminal, {})

