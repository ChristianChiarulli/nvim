local status_ok, hop = pcall(require, "hop")
if not status_ok then
	return
end
hop.setup()

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap



keymap("", "s", ":HopWordCurrentLine<cr>", { silent = true })
keymap("", "S", ":HopChar2<cr>", { silent = true })

keymap("", "f", ":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<CR>", opts)
keymap("", "F", ":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<CR>", opts)
keymap("", "t", ":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })<CR>", opts)
keymap("", "T", ":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })<CR>", opts)
