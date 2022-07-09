local status_ok, tree_climber = pcall(require, "tree-climber")
if not status_ok then
	return
end

local keyopts = { noremap = true, silent = true }
-- vim.keymap.set({'n', 'v', 'o'}, '<m-k>', require('tree-climber').goto_parent, keyopts)
-- vim.keymap.set({'n', 'v', 'o'}, '<m-j>', require('tree-climber').goto_child, keyopts)
-- vim.keymap.set({'n', 'v', 'o'}, '<m-j>', tree_climber.goto_next, keyopts)
-- vim.keymap.set({'n', 'v', 'o'}, '<m-k>', tree_climber.goto_prev, keyopts)
-- vim.keymap.set('n', '<m-h>', tree_climber.swap_prev, keyopts)
-- vim.keymap.set('n', '<m-l>', tree_climber.swap_next, keyopts)
