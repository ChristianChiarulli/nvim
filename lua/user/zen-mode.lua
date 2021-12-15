local status_ok, zen_mode = pcall(require, "zen-mode")
if not status_ok then
	return
end

zen_mode.setup({
	window = {
		backdrop = 1,
		height = 0.9, -- height of the Zen window
		width = 0.85,
		options = {
			signcolumn = "no", -- disable signcolumn
			number = false, -- disable number column
			relativenumber = false, -- disable relative numbers
			-- cursorline = false, -- disable cursorline
			-- cursorcolumn = false, -- disable cursor column
			-- foldcolumn = "0", -- disable fold column
			-- list = false, -- disable whitespace characters
		},
	},
	plugins = {
		gitsigns = { enabled = false }, -- disables git signs
		tmux = { enabled = false },
		twilight = { enabled = true },
	},
	-- on_open = function()
	--   vim.lsp.diagnostic.disable()
	--   vim.cmd [[
	--       set foldlevel=10
	--       IndentBlanklineDisable
	--       ]]
	-- end,
	-- on_close = function()
	--   vim.lsp.diagnostic.enable()
	--   vim.cmd [[
	--       set foldlevel=5
	--       IndentBlanklineEnable
	--       ]]
	-- end,
})
