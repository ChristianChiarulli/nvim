local keyopts = { noremap = true, silent = true }
-- vim.keymap.set({'n', 'v', 'o'}, '<m-k>', require('tree-climber').goto_parent, keyopts)
-- vim.keymap.set({'n', 'v', 'o'}, '<m-j>', require('tree-climber').goto_child, keyopts)
vim.keymap.set({'n', 'v', 'o'}, 'J', require('tree-climber').goto_next, keyopts)
vim.keymap.set({'n', 'v', 'o'}, 'K', require('tree-climber').goto_prev, keyopts)
vim.keymap.set('n', '<m-h>', require('tree-climber').swap_prev, keyopts)
vim.keymap.set('n', '<m-l>', require('tree-climber').swap_next, keyopts)
