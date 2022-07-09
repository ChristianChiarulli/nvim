local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
	return
end

toggleterm.setup({
	size = 20,
	open_mapping = [[<m-\>]],
	hide_numbers = true,
	shade_filetypes = {},
	shade_terminals = true,
	shading_factor = 2,
	start_in_insert = true,
	insert_mappings = true,
	persist_size = true,
	direction = "float",
	close_on_exit = true,
	shell = vim.o.shell,
	float_opts = {
		border = "curved",
		winblend = 0,
		highlights = {
			border = "Normal",
			background = "Normal",
		},
	},
})

function _G.set_terminal_keymaps()
  local opts = {noremap = true}
  -- vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<m-h>', [[<C-\><C-n><C-W>h]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<m-j>', [[<C-\><C-n><C-W>j]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<m-k>', [[<C-\><C-n><C-W>k]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<m-l>', [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

function _LAZYGIT_TOGGLE()
	lazygit:toggle()
end

local node = Terminal:new({ cmd = "node", hidden = true })

function _NODE_TOGGLE()
	node:toggle()
end

local ncdu = Terminal:new({ cmd = "ncdu", hidden = true })

function _NCDU_TOGGLE()
	ncdu:toggle()
end

local htop = Terminal:new({ cmd = "htop", hidden = true })

function _HTOP_TOGGLE()
	htop:toggle()
end

local python = Terminal:new({ cmd = "python", hidden = true })

function _PYTHON_TOGGLE()
	python:toggle()
end

local cargo_run = Terminal:new({ cmd = "cargo run", hidden = true })

function _CARGO_RUN()
	cargo_run:toggle()
end

local cargo_test = Terminal:new({ cmd = "cargo test", hidden = true })

function _CARGO_TEST()
	cargo_test:toggle()
end

local opts = { silent = true }

local keymap = vim.keymap.set

keymap("n", "<m-1>", "<cmd>1ToggleTerm direction=float<cr>", opts)
keymap("t", "<m-1>", "<cmd>1ToggleTerm direction=float<cr>", opts)
keymap("i", "<m-1>", "<cmd>1ToggleTerm direction=float<cr>", opts)

keymap("n", "<m-2>", "<cmd>2ToggleTerm size=60 direction=vertical<cr>", opts)
keymap("t", "<m-2>", "<cmd>2ToggleTerm size=60 direction=vertical<cr>", opts)
keymap("i", "<m-2>", "<cmd>2ToggleTerm size=60 direction=vertical<cr>", opts)

keymap("n", "<m-3>", "<cmd>3ToggleTerm size=10 direction=horizontal | set cmdheight=1<cr>", opts)
keymap("t", "<m-3>", "<cmd>3ToggleTerm size=10 direction=horizontal | set cmdheight=1<cr>", opts)
keymap("i", "<m-3>", "<cmd>3ToggleTerm size=10 direction=horizontal | set cmdheight=1<cr>", opts)
