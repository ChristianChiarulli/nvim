local status_ok, hop = pcall(require, "hop")
if not status_ok then
	return
end
hop.setup()

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap



keymap("", "s", ":HopWordCurrentLine<cr>", { silent = true })
keymap("", "S", ":HopChar2<cr>", { silent = true })

keymap("o", "f", ":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, inclusive_jump = true })<CR>", opts)
keymap("o", "F", ":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<CR>", opts)
keymap("o", "t", ":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, inclusive_jump = false })<CR>", opts)
keymap("o", "T", ":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, inclusive_jump = false })<CR>", opts)
