local M = {
  -- url = "git@github.com:ChristianChiarulli/bookmark.nvim.git",
  "ChristianChiarulli/bookmark.nvim",
  event = "VeryLazy",
  dependencies = {
    "kkharji/sqlite.lua",
  },
}

function M.config()
  -- local m_opts = {
  --   mode = "n", -- NORMAL mode
  --   prefix = "m",
  --   buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  --   silent = true, -- use `silent` when creating keymaps
  --   noremap = true, -- use `noremap` when creating keymaps
  --   nowait = true, -- use `nowait` when creating keymaps
  -- }
  --
  -- local m_mappings = {
  --   b = { "<cmd>BookmarkToggle<cr>", "Toggle" },
  --   j = { "<cmd>BookmarkNext<cr>", "Next" },
  --   k = { "<cmd>BookmarkPrev<cr>", "Prev" },
  --   c = { "<cmd>BookmarkClear<cr>", "Clear" },
  --   l = { "<cmd>BookmarkList<cr>", "List" },
  --   -- f = { "<cmd>FilemarkToggle<cr>", "Mark File" },
  --   m = { '<cmd>lua require("harpoon.mark").add_file()<cr>', "Harpoon" },
  --   -- ["."] = { '<cmd>lua require("harpoon.ui").nav_next()<cr>', "Harpoon Next" },
  --   -- [","] = { '<cmd>lua require("harpoon.ui").nav_prev()<cr>', "Harpoon Prev" },
  --   -- l = { "<cmd>lua require('user.bfs').open()<cr>", "Buffers" },
  --   -- s = { "<cmd>Telescope harpoon marks<cr>", "Search Files" },
  --   -- s = {
  --   --   "<cmd>lua require('telescope').extensions.vim_bookmarks.all({ hide_filename=false, prompt_title=\"bookmarks\", shorten_path=false })<cr>",
  --   --   "Show",
  --   -- },
  --   -- [";"] = { '<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>', "Harpoon UI" },
  -- }
  --
  -- which_key.register(m_mappings, m_opts)

  require("bookmark").setup {
    sign = "",
    highlight = "Constant",
  }

  require("telescope").load_extension "bookmark"
end

return M
