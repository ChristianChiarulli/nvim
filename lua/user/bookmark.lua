-- highlight BookmarkSign ctermbg=NONE ctermfg=160
-- highlight BookmarkLine ctermbg=194 ctermfg=NONE
local icons = require "user.icons"
vim.g.bookmark_sign = icons.ui.BookMark
vim.g.bookmark_annotation_sign = icons.ui.Comment
vim.g.bookmark_no_default_key_mappings = 1
vim.g.bookmark_auto_save = 0
vim.g.bookmark_auto_close = 0
vim.g.bookmark_manage_per_buffer = 0
vim.g.bookmark_save_per_working_dir = 0
-- vim.g.bookmark_highlight_lines = 1
vim.g.bookmark_show_warning = 0
vim.g.bookmark_center = 1
vim.g.bookmark_location_list = 0
vim.g.bookmark_disable_ctrlp = 1
vim.g.bookmark_display_annotation = 0
-- vim.g.bookmark_auto_save_file = '~/.config/lvim/bookmarks'
